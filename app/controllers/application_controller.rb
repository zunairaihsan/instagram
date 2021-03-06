class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery

    def after_sign_in_path_for(resource) 
        accountposts_path(current_account)
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image , :username, :name, :gender , :bio, :phone , :website ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :username, :name, :gender , :bio, :phone , :website ])
  end
    
end
