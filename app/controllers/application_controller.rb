class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_registration_path(resource_name), :alert => exception.message
  end

  helper_method :resource, :resource_name

  def resource
    User.new
  end

  def resource_name
    :user
  end

  
end
