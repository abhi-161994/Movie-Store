class ApplicationController < ActionController::Base
#  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 private

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:image])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])

  end

  # def flash_to_headers
  #   return unless request.xhr?
  #   response.headers['X-Message'] = flash_message
  #   response.headers["X-Message-Type"] = flash_type.to_s
  # end
  #
  #   def flash_message
  #   [:error,:alert,:notice].each do |type|
  #     return flash[type] unless flash[type].blank
  #   end
  # end
  #
  #
  #     def flash_type
  #     [:error,:alert,:notice].each do |type|
  #       return type unless flash[type].blank
  #     end
  #   end
end
