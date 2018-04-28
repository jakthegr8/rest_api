class EmployeesController < ApplicationController
  def index
    paginate Employee.all, per_page: 10
  end

  def get_hierarchy
    paginate Employee.get_hierarchy(params[id]), per_page: 10
  end

  def create
    emp = Employee.create!(create_employee_params)
    render json: Employee.find(emp).as_json
  end

  def top_employees
    paginate Employee.get_top_employees, per_page: 10
  end

  private

  def create_employee_params
    params.require(:employee).permit(:name, :emp_id, :salary, :ratings, :date_of_joining, :ceo_id, :vp_id, :director_id, :manager_id)
  end
end
