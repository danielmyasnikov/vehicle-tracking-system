class EmailNotificationsController < ApplicationController
  def update
    email_notification = EmailNotification.find(params[:id])
    email_notification.update_attributes(params[:email_notification])
    redirect_to :back
  end
end