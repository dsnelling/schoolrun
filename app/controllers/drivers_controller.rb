class DriversController < ApplicationController

  before_filter :current_user

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drivers }
    end
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
    @driver = Driver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @driver }
    end
  end

  # GET /drivers/new
  # GET /drivers/new.json
  def new
    @driver = Driver.new
    @event = Event.find(params[:event_id])
    @driver.status = "Confirmed" # set as default

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @driver }
    end
  end

  # GET /drivers/1/edit
  def edit
    @driver = Driver.find(params[:id])
    @event = @driver.event
  end

  # POST /drivers
  # POST /drivers.json
  def create
    event = Event.find(params[:event_id])
    @driver = @current_user.drivers.build(params[:driver])
    @driver.event = event

    respond_to do |format|
      if @driver.save
        format.html { redirect_to event_url(@driver.event),
            notice: 'Driver was successfully allocated.' }
        format.json { render json: @driver, status: :created, location: @driver }
        expire_action :controller => "events", :action => "index"
      else
        format.html { render action: "new" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drivers/1
  # PUT /drivers/1.json
  def update
    @driver = Driver.find(params[:id])
    @driver.user = @current_user

    respond_to do |format|
      if @driver.update_attributes(params[:driver])
        format.html { redirect_to event_url(@driver.event),
             notice: 'Driver was successfully updated.' }
        format.json { head :no_content }
              else
        format.html { render action: "edit" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
    expire_action :controller => "events", :action => "index"
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    expire_action :controller => "events", :action => "index"
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

end
