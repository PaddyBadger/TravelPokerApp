class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :resource, :resource_name

  def resource
    User.new
  end

  def resource_name
    :user
  end
end
