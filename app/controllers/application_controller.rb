class ApplicationController < ActionController::Base
  protected

  def cinfigure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avator])
  end
end
