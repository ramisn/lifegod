class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def appt_time
    appointment_time.in_time_zone(time_zone) #this is the appointment owners time zone
  end
end
