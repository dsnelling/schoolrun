class ApplicationController < ActionController::Base
  before_filter :authorise
  protect_from_forgery

  private

  def current_user
    user_id = session[:user_id]
    @user = User.find(user_id) if user_id
  end

#  def find_user
#    user_id = session[:user_id]
#    redirect to login_url, :notice => "Please login" unless user_id
#    @user = User.find(user_id)
#  end

  protected

    def authorise
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please login"
      end
    end
end
