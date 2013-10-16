class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :resource, :resource_name

  def resource
    User.new
  end

  def resource_name
    :user
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
