module OccupantsHelper

  def highlight_if_changed(occupant)
    "highlight" if occupant.has_changed?
  end


end
