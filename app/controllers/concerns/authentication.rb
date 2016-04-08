module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :ensure_authenticated_user
  end

  private

  def ensure_authenticated_user
    authenticate_session(cookies.signed[:user_id]) || redirect_to(new_team_session_url)
  end
  
  def authenticate_session(user_id)
        if user = User.find_by(id: user_id)
          @current_user = user
        end
      end

  def authenticate_user(username, password)
    user = User.find_by(email: username)
    if user && PasswordDigester.compare(user.password_digest, password)
      cookies.signed[:user_id] ||= user.id
      @current_user = user
    end
  end

  def unauthenticate_user
    ActionCable.server.disconnect(current_user: @current_user)
    @current_user = nil
    cookies.delete(:user_id)
  end
end
