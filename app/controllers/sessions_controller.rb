class RegistrationsController < Devise::RegistrationsController
  def new
    :layout => 'login'
    super
    
  end
  
  def create
    super
  end
  
  def destroy
    super
  end
  
end