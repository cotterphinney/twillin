class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :twilio_sid, :twilio_token, :twilio_phone)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :twilio_sid, :twilio_token, :twilio_phone)
    end
  end
end
