class ReportController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyReports"
    session[:module_logo] = 'report-guy.png' 
  end
  
  def index
    @reports = Report.truck_fleet_reports(current_user.truck_fleet_id)
    @fleets = current_user.truck_fleet.fleets
    
    @type = params[:filter].present? ? params[:filter][:type] : []
    @services = params[:filter].present? ? params[:filter][:service] : []
    type = params[:filter].present? ? params[:filter][:type] : nil
    services = params[:filter].present? ? params[:filter][:service] : nil
    
    array_lastMonths = Report.arr_of_last_12_months
    
    @graph_reports = Report.reports_for_graph @reports, services, type
    if @graph_reports
      @graph_monthly_spent_vehicles = LazyHighCharts::HighChart.new('graph') do |f|
        f.options[:chart][:defaultSeriesType] = "area"
        @graph_reports.each do |fleet, value|
          f.xAxis(:categories => array_lastMonths,
            :labels => {
              :rotation => -45,
              :align => 'right',
            }
          )
          f.series(:name => fleet, :data => value)
        end
      end
    end
    

    
    reports = Report.reports_for_pie_array @reports, services, type
        
    @total_chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type => 'pie',
               :name => 'Browser share',
               :data => reports.collect {|k, v| [k, v]}
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
