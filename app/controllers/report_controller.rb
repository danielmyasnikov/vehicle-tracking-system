class ReportController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyReports"
    session[:module_logo] = 'report-guy.png' 
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
        f.xAxis(:categories => reports[:months])
        f.series(:name => fleet.name, :data => reports[:warranty].zip(reports[:service], reports[:breakdown], reports[:repair], reports[:damage]).map {|e| e.map(&:to_i).inject(&:+) })
      end
    end    

    data = []
    @fleets.each do |f|
      # TODO: refactor
      total = 0
      total += f.reports.sum(:warranty)
      total += f.reports.sum(:service)
      total += f.reports.sum(:damage)
      total += f.reports.sum(:breakdown)
      total += f.reports.sum(:repair)
      data << [f.name, total] 
    end if params['make'].nil? && params['model'].nil?
        
    @chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type => 'pie',
               :name => 'Browser share',
               :data => [['say', 100],['may', 500]]
      }
      f.series(series)
      f.yAxis(:labels => 'low')
      f.options[:title][:text] = "Total spend on services"
      f.legend(:title => "title", :layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
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
  
end
