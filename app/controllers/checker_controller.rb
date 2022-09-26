class CheckerController < ApplicationController
	def show
	end

	def register
		@employee = Employee.find_by(id_employee: params[:id_employee])
		if @employee.nil?
			redirect_to '/', danger: 'Employee not found'
		elsif !@employee.status
			redirect_to '/', warning: 'Employee is not active'
		else
			date = Date.current
			@log = DailyLog.find_by(day: date, employee: @employee)

			if @log.nil?
				check_in = Time.current
				DailyLog.create(day: date, check_in: check_in, employee: @employee)
				redirect_to '/', success: "Welcome, #{@employee.name}."+"Check In registered succesfully at: #{check_in.strftime("%H:%M")}"
			elsif @log.check_out.nil?
				check_out = Time.current
				@log.update(check_out: check_out)
				redirect_to '/', success: "Goodbye, #{@employee.name}."+"Check Out registered succesfully at: #{check_out.strftime("%H:%M")}"
			else
				redirect_to '/', warning: 'Error: Employee have already checked out'
			end
		end
	end

end
