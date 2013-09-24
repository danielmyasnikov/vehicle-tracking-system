class ReportController < ApplicationController
  before_filter :menu_activization
  
  def menu_activization
    session[:active_menu] = "MyReports"
    session[:module_logo] = 'report-guy.png' 
  end
  
  def index
    @reports = Report.truck_fleet_reports(current_user.truck_fleet_id)
    @fleets = current_user.truck_fleet.fleets
    array_lastMonths = []
    (0..12).each do |r|
      array_lastMonths << (Date.today - r.months).strftime("%Y/%m")
    end
    @graph_reports = Report.reports_for_graph({}, @reports)
    if (@graph_reports)
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
    data = []
    
    reports = Report.reports_for_pie_array(params, @reports)
    @fleets.each do |f|
      # TODO: refactor
      total = 0
      total += f.reports.sum(:warranty)
      total += f.reports.sum(:service)
      total += f.reports.sum(:damage)
      total += f.reports.sum(:breakdown)
      total += f.reports.sum(:repair)
      total += f.reports.sum(:parts)
      total += f.reports.sum(:services)
      data << [f.name, total] 
    end if params['make'].nil? && params['model'].nil?
        
    @total_chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type => 'pie',
               :name => 'Browser share',
               :data => reports
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
