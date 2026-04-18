class ApplicationController < ActionController::API
  include Devise::Controllers::Helpers

  # Disable ALL flash usage
  def set_flash_message!(*); end
  def set_flash_message(*); end
end
