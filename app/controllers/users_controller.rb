class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to :back
  end
end