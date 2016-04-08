class UserMailer < ActionMailer::Base
  default from: "support@example.com"

   def transcript(chat, email)
     @chat = chat
     
     mail(to: email, subject: 'Your chat transcript')
   end
  
end
