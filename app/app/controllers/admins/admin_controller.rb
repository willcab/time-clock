class Admins::AdminController < ApplicationController
	def new
	end

	def create
		admin= Admin.find_by(password: params[:password])
		session[:admin_id]=admin.id unless admin.nil?
		if admin.nil?
			redirect_to '/'
		else
			redirect_to '/', notice: "Welcome Admin"
		end
	end

	def logout
		session[:admin_id]= nil
		redirect_to '/', notice: "Logged out"
	end

end

