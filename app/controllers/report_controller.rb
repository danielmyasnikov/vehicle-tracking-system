class ReportController < ApplicationController
  def index
    @services = Service.all
    respond_to do |format|
      format.html
    end
  end

  def show
  end
end
