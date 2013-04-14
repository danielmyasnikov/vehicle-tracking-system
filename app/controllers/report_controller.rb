class ReportController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyReports"
    session[:module_logo] = 'MyReports/MyReports.jpg' 
  end
  
  def index
    #@fleets = current_user.truck_fleet.fleets                                   if @params['type'] == 'fleet_number'
    #@fleets = current_user.truck_fleet.fleets.where(:model => @params['model']) if @params['type'] == 'model'
    #@fleets = current_user.truck_fleet.fleets.where(:make => @params['make'])   if @params['type'] == 'make'
    
    # 1. Get all reports for the truck_fleet
    # 2. Group them by model / make / fleet_number
    # 3. Group them by date
    # 4. Group them service name
    # 5. Prepare data for the high chart
    # 6. Push data to hight charts
    # 7. Get filters from the chart index page
    # 8. 1 - 6
    
    @reports = current_user.truck_fleet.reports
    @fleets = current_user.truck_fleet.fleets
    puts params
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:chart][:defaultSeriesType] = "area"
      @fleets.each do |fleet|
        reports = fleet.reports_price_by_months_array
        # TODO: refactor
        f.series(:name => fleet.name, :data => reports)
      end
    end    
    






















    
    


    
    data = []
    @fleets.each do |f|
      data << { :name => f.name, :y => f.services_total } 
    end if params['make'].nil? && params['model'].nil?
    
    # by make
    makes = @fleets.scoped.pluck(:make).uniq.compact
    makes.each do |m|
      total_price = 0
      fleets = @fleets.scoped.where(:make => m)
      fleets.each do |fleet|
        total_price += fleet.services_total
      end
      data << { :name => m, :y => total_price } 
    end if params['make']
    
    # by model
    models = @fleets.scoped.pluck(:model).uniq.compact
    models.each do |m|
      total_price = 0
      fleets = @fleets.scoped.where(:model => m)
      fleets.each do |fleet|
        total_price += fleet.services_total
      end
      data << { :name => m, :y => total_price } 
    end if params['model']
    
    @chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> data
      }
      f.series(series)
      f.options[:title][:text] = "Total spend on services"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"white",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
    
    respond_to do |format|
      format.html
    end
  end

  def show
  end
  
  private
  
  def get_reports(breakdown = [], repair = [], service = [], damage = [], warranty = [])
    
  end
end
