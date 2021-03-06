class OccupantsController < ApplicationController
  # provides link between people who are in a car and events that people are 
  # needing pickup from 
  # 
  before_filter :current_user

  # GET /occupants
  # GET /occupants.json
  def index
    @occupants = Occupant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occupants }
    end
  end

  # GET /occupants/1
  # GET /occupants/1.json
  def show
    @occupant = Occupant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occupant }
    end
  end

  # GET /occupants/new
  # GET /occupants/new.json
  def new
    @occupant = Occupant.new
    @event = Event.find(params[:event_id])
    user = params[:user_id] ? User.find(params[:user_id]) : @current_user
    @occupant.user = user
    @occupant.status = "Confirmed" # set as default 

    respond_to do |format|
      format.html { render :layout => false } # new.html.erb
      format.json { render json: @occupant }
    end
  end

  # GET /occupants/1/edit
  def edit
    @occupant = Occupant.find(params[:id])
    @event = @occupant.event
    
    render :layout => false
  end

  # POST /occupants
  # POST /occupants.json
  def create
    event = Event.find(params[:event_id])
    @occupant = Occupant.new(params[:occupant])
    @occupant.event = event
    
    respond_to do |format|
      if @occupant.save
        format.html { redirect_to event_url(@occupant.event),
             notice: 'Occupant request was successfully created.' }
        format.json { render json: @occupant, status: :created, location: @occupant }
      else
        format.html { render action: "new" }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
    expire_fragment "event-#{@occupant.event.id}"
  end

  # PUT /occupants/1
  # PUT /occupants/1.json
  def update
    @occupant = Occupant.find(params[:id])

    respond_to do |format|
      if @occupant.update_attributes(params[:occupant])
        format.html { redirect_to event_url(@occupant.event),
            notice: 'Occupant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @occupant.errors, status: :unprocessable_entity }
      end
    end
    expire_fragment "event-#{@occupant.event.id}"
  end

  # DELETE /occupants/1
  # DELETE /occupants/1.json
  def destroy
    @occupant = Occupant.find(params[:id])
    @occupant.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
    expire_fragment "event-#{@occupant.event.id}"

  end

end
