module Team
  class SessionsController < ApplicationController
    skip_before_action :ensure_authenticated_user, only: %i( new create )

    layout 'login'

    def new
      @users = User.all
    end

    def create
      authenticate_user(params[:username], params[:password])
      redirect_to team_chats_url(closed: false)
    end

    def destroy
      unauthenticate_user
      redirect_to new_team_session_url
    end
  end
end