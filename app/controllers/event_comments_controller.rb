class EventCommentsController < ApplicationController

  #before_filter :find_event
  before_filter :current_user

  # GET /event_comments
  # GET /event_comments.json
  # should not come here
  def index
    @event = Event.find(params[:event_id])
    @event_comments = @event.event_comments

    respond_to do |format|
      format.html { render :layout => false }
      format.json { render json: @event_comments }
    end
  end

  # GET /event_comments/1
  # GET /event_comments/1.json
  # should not come here
  def show
    @event_comment = EventComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_comment }
    end
  end

  # GET /event_comments/new
  # GET /event_comments/new.json
  def new
    @event_comment = EventComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_comment }
    end
  end

  # GET /event_comments/1/edit
  def edit
    @event_comment = EventComment.find(params[:id])
  end

  # POST /event_comments
  # POST /event_comments.json
  def create
    @event = Event.find(params[:event_id])
    @event_comment = @event.event_comments.build(params[:event_comment])
    @event_comment.comment_by = @current_user

    respond_to do |format|
      if @event_comment.save
        format.html { redirect_to @event, notice: 'Event comment was successfully created.' }
        format.json { render json: @event, status: :created, location: @event_comment }
      else
        format.html { redirect_to @event, notice: 'Comment could not be saved' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    expire_fragment "event_comments-#{@event.id}"
  end

  # PUT /event_comments/1
  # PUT /event_comments/1.json
  def update
    @event_comment = EventComment.find(params[:id])

    respond_to do |format|
      if @event_comment.update_attributes(params[:event_comment])
        format.html { redirect_to event_url(@event_comment.event),
          notice: 'Event comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_comment.errors, status: :unprocessable_entity }
      end
    end
    expire_fragment "event_comments-#{@event.id}"
  end

  # DELETE /event_comments/1
  # DELETE /event_comments/1.json
  def destroy
    @event_comment = EventComment.find(params[:id])
    event = @event_comment.event
    @event_comment.destroy

    respond_to do |format|
      format.html { redirect_to event_url(event) }
      format.json { head :no_content }
    end
    expire_fragment "event_comments-#{event.id}"
  end

  private
  def find_event
    @event_id = params[:event_id]
    return redirect_to events_url unless @event_id
    @event = Event.find(@event_id)
  end

end
