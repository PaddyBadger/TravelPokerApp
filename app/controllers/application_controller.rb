class ApplicationController < ActionController::Base
  respond_to :html, :js
  
  protect_from_forgery

  before_filter :prep_mobile

  def is_mobile?
    request.user_agent =~ /Mobile|webOS|iPhone|Android/
  end

  def prep_mobile
    prepend_view_path "app/views/mobile" if is_mobile?
  end

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
