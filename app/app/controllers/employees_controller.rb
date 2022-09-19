class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
      if @employee.update(employee_params)
        flash[:success] = "Object was successfully updated"
        redirect_to store_employee_path(@employee.store, @employee)
      else
        render 'edit', status: :unprocessable_entity
      end
  end

  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Object successfully created"
      redirect_to store_employee_path(@employee.store, @employee)
    else
      flash[:error] = "Something went wrong"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.status = !@employee.status
    @employee.save
    redirect_to store_path(@employee.store), notice: @employee.status ? "Employee is active" : "Employee is deactivated", status: 303
  end
  
  private
  def employee_params
    params.require(:employee).permit(:name, :email, :position, :id_employee, :private_number, :store_id)
  end
end
