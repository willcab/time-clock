class ReportController < ApplicationController
  def index
    @reports = DailyLog.where("EXTRACT(MONTH FROM day) = 9").joins("INNER JOIN employees ON employees.status = true").to_a.count -(Employee.where("status = true").to_a.count*Time.days_in_month(Time.current.month))
  end

end
