class Admins::ReportController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:index]
  def index
    @today = Time.current
    @year = params.has_key?(:date)? params[:date][:year].to_i : @today.year
    @month = params.has_key?(:date)? params[:date][:month].to_i : @today.month
    @monthly_reports = DailyLog.search_by_year(@year).search_by_month(@month).joins(:employee).merge(Employee.active_employees)
    @days_in_month = (@month == @today.month)? (@today.day) : Time.days_in_month(@month,@year)
    if !@monthly_reports.empty?
      create_reports
    end
  end

  def create_reports
    attendance_by_day
    absence_by_month
    average_time
  end

  def absence_by_month
    @active_employees = Employee.active_employees.count
    @absence =  @active_employees*@days_in_month - @monthly_reports.count
  end

  def attendance_by_day
    @attendance = []
    for day in 1..@days_in_month
  	  @attendance << @monthly_reports.search_by_day(day).count
    end
  end

  def average_time
    check_in_hours = [0,0]
    check_out_hours = [0,0]
    for day in 1..@days_in_month
      @monthly_reports.search_by_day(day).each do |log|
        if log 
          check_in_hours[0] += log.check_in.hour
          check_in_hours[1] += log.check_in.min
          if log.check_out
          check_out_hours[0] += log.check_out.hour
          check_out_hours[1] += log.check_out.min
          end
        end
      end
    end
    number_of_logs = @monthly_reports.count
    @avg_check_in = check_in_hours.map {|num| num / number_of_logs}
    @avg_check_out = check_out_hours.map {|num| num / number_of_logs}
  end
end
