class ApplicationController < ActionController::Base
  before_filter :authorise
  before_filter :current_user
  before_filter :prep_for_mobile
  protect_from_forgery

  private

    def current_user
      user_id = session[:user_id]
      if user_id
        user = User.find(user_id)
        @is_admin = (user.role == "Admin")
        @current_user = user
      end
    end

    def prep_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
    end

  protected

    def authorise
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please login"
      end
    end
end
