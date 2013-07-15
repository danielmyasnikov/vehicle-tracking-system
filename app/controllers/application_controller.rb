class ApplicationController < ActionController::Base
  protect_from_forgery
  
  $not_available = 'Not available'
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      calendar_index_path
    elsif resource.is_a?(AdminUser) 
      admin_dashboard_path(resource)
    else
      new_user_session
    end
  end
end
