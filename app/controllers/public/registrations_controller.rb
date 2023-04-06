class Public::RegistrationsController < Devise::RegistrationsController
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
      root_path
  end 
  
  
  
  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  
  def after_update_path_for(resource)
    camper_path(resource)
  end
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
  			 keys: [:first_name, :last_name, :camper_name, ])
  end

end
