App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $("[data-channel='comments']")

  connected: ->
    # FIXME: While we wait for cable subscriptions to always be finalized before sending chats
    setTimeout =>
      @followCurrentChat()
      @installPageChangeCallback()
    , 1000

  received: (data) ->
    @collection().append(data.comment) unless @userIsCurrentUser(data.comment)

  userIsCurrentUser: (comment) ->
    $(comment).attr('data-user-id') is $('meta[name=current-user]').attr('id')

  followCurrentChat: ->
    if chatId = @collection().data('chat-id')
      @perform 'follow', chat_id: chatId
    else
      @perform 'unfollow'
      

  installPageChangeCallback: ->
    unless @installedPageChangeCallback
      @installedPageChangeCallback = true
      $(document).on 'page:change', -> App.comments.followCurrentChat()
