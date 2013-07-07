class LogsController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyLogs"
    session[:module_logo] = "" 
  end
  
  def index
    @logs = Log.scoped.order("created_at DESC")
  end

  def view
    @log = Log.find(params[:id])
  end
end
