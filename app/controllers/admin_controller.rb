class AdminController < ApplicationController
  def index
  end

  def team_email
  end

  def send_email
    q = []
    q << "Parent" if params[:parent_email]
    q << "Student" if params[:student_email]
    users = User.where(:role => q )
    m = params[:message]
    users.each do |u|
      UserMailer.notification({:user => u, :message => params[:message]}).deliver
    end
    @query = q
    @sent_count = users.count
  end

end
