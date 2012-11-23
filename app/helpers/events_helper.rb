module EventsHelper
  def add_traveller_link(traveller)
    # children can add themselves to the list for pickup
    if @current_user.id == traveller.user.id && person.user.role == "Student"
      link_to "#{traveller.user.first_name} #{traveller.user.surname}",
        edit_occupant_path(traveller)

    # parents can nominate themselves to pickup
    elsif @current_user.id == traveller.user.id &&
                      traveller.user.role == "Parent"
      link_to "#{traveller.user.first_name} #{traveller.user.surname}",
                   edit_driver_path(traveller)

    # parent can nominate their child to be picked up
    elsif traveller.user.parent && @current_user.id == traveller.user.parent.id
      link_to "#{traveller.user.first_name} #{traveller.user.surname}",
        edit_occupant_path(traveller)

    else
      # static text
      "#{traveller.user.first_name} #{traveller.user.surname}"
    end
  end

  def remove_traveller_link(traveller)
    # children can remove themselves
    if (@current_user.id == traveller.user.id || @is_admin ) &&
           traveller.user.role == "Student"
      button_to "Cry-off", occupant_path(traveller.id), :method => :delete

    # parents can cry-off their own children
    elsif traveller.user.parent && (@current_user.id ==
          traveller.user.parent_id) && traveller.user.role == "Student"
      button_to "Cry-off", occupant_path(traveller.id), :method => :delete

    # parents can rescind their option to drive
    elsif (@current_user.id == traveller.user.id || @is_admin) && 
       traveller.user.role == "Parent"
      button_to "Rescind", driver_path(traveller.id), :method => :delete

    # one parent can takeover another parent
    elsif (@current_user.id != traveller.user.id) && @current_user.role ==
       "Parent" && traveller.user.role == "Parent"
      link_to "Takeover", edit_driver_path(traveller.id)
    end
  end

end
