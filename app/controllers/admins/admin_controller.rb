class Admins::AdminController < ApplicationController
	before_action :redirect_if_authenticated, only: [:create, :new]
	def new
	end

	def create
		admin= Admin.find_by(password: params[:password])
		session[:admin_id]=admin.id unless admin.nil?
		after_login_path = session[:user_return_to] || root_path
		if admin.nil?
			redirect_to new_admin_path, danger: "Wrong password"
		else
			redirect_to after_login_path, success: "Login successfuly, Welcome Admin"
		end
	end

	def logout
		session[:admin_id] = nil
		session[:user_return_to] = nil
		redirect_to '/', warning: "Logged out"
	end

end

