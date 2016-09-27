class ChartsController < ApplicationController
  before_action :set_support, only: [:report_by_support]
  
  def index
    date_now  = Time.now.strftime("%Y-%m-%d")
    @start_date = params[:start_date] 
    @end_date = params[:end_date] 
    @reports_day = Support.where("cast(created_at as date)='#{date_now}'").count
     start_date = Date.strptime(@start_date,  "%m/%d/%Y") if @start_date!=nil
     end_date = Date.strptime(@end_date,  "%m/%d/%Y") if @end_date!=nil
    @supports = Support.all_order_by_date start_date, end_date, params[:page], 20
  end 

  def total_reopen
  	total_support = Support.all.count
  	total_support_re_open = Support.where('re_open_count is not null').count
    
    @data = Hash.new
    @data['Total Support'] = total_support
    @data['Total Re-open'] = total_support_re_open

  end

  def total_by_area
  end

  def report_supports
  	@supports = Support.all
  end

  def report_by_support
  	@create_pending = @support.date_pending ? ((@support.date_pending- @support.created_at)/1.hour).round : 0
    @pending_pre_close = @support.date_preclose ? (( @support.date_preclose- @support.date_pending)/1.hour).round : 0
    @pending_close = @support.date_close ? (( @support.date_close- @support.date_pending)/1.hour).round : 0
 
    @data = Hash.new
    @data['Creado - Abierto']= @create_pending
    if @support.date_preclose 
       @data['Abierto - Pre-Finalizado']= @pending_pre_close if @support.date_preclose != nil
    else
      @data['Abierto - Finalizado'] = @pending_close if @support.date_close != nil
    end
  
    #  @data = Array.new
    #  @data  << ['Creado - Abierto', @support.created_at, @support.date_pending]
    #  @data  << ['Abierto - Pre Finalizado', @support.date_pending, @support.date_preclose]
    #  @data  << ['Abierto - Finalizado', @support.date_pending, @support.date_close]
  end

  def daily_report
  end

  private
    def set_support
      @support = Support.find(params[:id])
    end
end
