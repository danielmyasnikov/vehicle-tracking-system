class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize
  
  def authorize
    if !params["controller"].match("devise")
      unless current_user
        redirect_to new_user_session_path, notice: "Please log in"
        return
      end
    end
  end
  
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
