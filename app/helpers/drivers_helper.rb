module DriversHelper

  def highlight_if_changed(driver)
    "highlight" if driver.has_changed?
  end
end
