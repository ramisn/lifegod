class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_member!
  def appt_time
    appointment_time.in_time_zone(time_zone) #this is the appointment owners time zone
  end

  def show
    @member = Member.find(params[:id])
    unless @member == current_member
      redirect_to :back, :alert => "Access denied."
    end
  end
end
