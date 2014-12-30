class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
  
end
