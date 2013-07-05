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
    if (params[:approve])
      @user = User.find(params[:id])
      @user.to_approve
      redirect_to customers_path
    elsif (params[:update_customer])
      p 'in here:))))'
      redirect_to :back
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to :back
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to customers_path
  end

end