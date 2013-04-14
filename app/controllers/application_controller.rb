class ApplicationController < ActionController::Base
  protect_from_forgery
  
  $not_available = 'Not available'
  
  def after_sign_in_path_for(resource)
    if resource.admin?
      customers_path
    else
      calendar_index_path
    end
  end
end
