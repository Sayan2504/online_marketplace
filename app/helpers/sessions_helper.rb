module SessionsHelper
    def log_in(user)
      session[:user_id] = user.id
    end

    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      end
    end

    def logged_in?
      current_user.present?
    end

    def forget(user)
      # user.forget
      cookies.delete(:user_id)
      # cookies.delete(:remember_token)
    end

    def log_out
      forget(current_user)
      session.delete(:user_id)
      @current_user = nil
    end
end
