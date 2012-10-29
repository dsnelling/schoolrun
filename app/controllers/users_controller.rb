class UsersController < ApplicationController
  before_filter :is_admin
  #before_filter :check_admin, :except => [:index, :show ]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


  # GET /users/1
  # GET /users/1.json
  def show
    #unless admin, can only show ourselves
    if @is_admin
      @user = User.find(params[:id])
    else
      current_user
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url,
          notice: "User #{@user.name} was successfully created." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @is_admin
      a = params[:user]
    else
      a = { :password => params[:user][:password],
        :password_confirmation => params[:user][:password_confirmation],
        :email => params[:user][:email]
        }
    end

    respond_to do |format|
      if @user.update_attributes(a)
        format.html { redirect_to user_url(@user),
            notice: "User #{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors,
             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # seems we are duplicating this, but to avoid clash of users
    def is_admin
      user_id = session[:user_id]
      redirect_to login_url, :notice => "Please login" unless user_id
      logged_in_as = User.find(user_id)
      @is_admin = ( logged_in_as.role == "Admin")
    end

    def check_admin
      redirect_to users_path unless @is_admin
    end
end
