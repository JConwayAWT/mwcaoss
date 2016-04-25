class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_alert_death

  def index
    render layout: "less_padding"
  end

  def about
    render layout: "less_padding"
  end

  def service_of_process
  end

  def research_and_investigation
  end

  def check_alert_death
    Alert.all.each do |alert|
      if Time.now > alert.created_at + alert.lifespan_in_hours.hours
        alert.destroy
      end
    end
  end


  
end
