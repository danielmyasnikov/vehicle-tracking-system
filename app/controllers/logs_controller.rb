class LogsController < ApplicationController
  def index
    @logs = Log.scoped.order("created_at DESC")
  end

  def view
    @log = Log.find(params[:id])
  end
end
