class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization unless: :devise_controller?

  protected

  def page
    page = (params[:page].presence || 1).to_i
    page = 1 if page < 1
    page
  end

  def per_page
    per_page = (params[:per_page].presence || 25).to_i
    per_page = nil if per_page < 1 # Default to no limit if negative value given
    per_page
  end
end
