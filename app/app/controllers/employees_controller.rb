class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end
  

  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(employee_params)
      if @employee.update_attributes(params[:employee])
        flash[:success] = "Object was successfully updated"
        redirect_to @employee
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  def new
    @employee = Employee.new
  end
  
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Object successfully created"
      redirect_to @employee
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to employee_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to employee_url
    end
  end
  
  private
  def employee_params
    params.require(:employee).permit(:name, :email, :position, :id_employee, :private_number, :store_id)
  end
end
