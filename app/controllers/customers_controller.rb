class CustomersController < ApplicationController
  before_filter :authenticate_user!

  def index
    # authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.find_all_by_approved(false)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    @user.to_approve
    redirect_to customers_path
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to customers_path
  end

end