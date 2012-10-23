class AdminController < ApplicationController
  def index
    @open_events = 45 #--Event.count(
    @closed_events = 92 #--Event.count(45
  end
end
