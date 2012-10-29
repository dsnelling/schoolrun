class SessionsController < ApplicationController
  skip_before_filter :authorise

  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      if user.role == "Admin"
        redirect_to admin_url
      elsif user.change_password
        redirect_to edit_user_url(user), :alert => "Please change your password"
      else
        redirect_to events_url
      end
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to events_url, :notice => "Logged out"
  end
end
