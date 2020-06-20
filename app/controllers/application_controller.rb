class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def show_user_icon
    @user = User.find(current_user.id) if user_signed_in?
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[avator])
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname])
    end
end
