class CheckerController < ApplicationController
	def show
	end
	
	def register
		@employee = Employee.find_by(id_employee: params[:id_employee])
		if @employee.nil?
			redirect_to '/', notice: 'Employee not found'
		else
			@date = Date.current

			@log = DailyLog.find_by(day: @date, employee: @employee)

			if @log.nil?
				DailyLog.create(day: @date, checkIn: Time.now, employee: @employee )
				redirect_to '/', notice: 'successfully checker'
			elsif @log.checkOut.nil?
				@log.update(checkOut: Time.now)
				redirect_to '/', notice: 'successfully checker'
			else
				redirect_to '/', notice: 'Employee had already checked out'
			end
		end
	end

end
