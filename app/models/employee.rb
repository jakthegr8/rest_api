class Employee < ApplicationRecord
  has_one :vp, class_name: "Employee", foreign_key: "vp_id"
  has_one :director, class_name: "Employee", foreign_key: "director_id"
  has_one :manager, class_name: "Employee", foreign_key: "manager_id"

  belongs_to :ceo, class_name: "Employee"
  belongs_to :vp, class_name: "Employee"
  belongs_to :director, class_name: "Employee"
  belongs_to :manager, class_name: "Employee"

  TOP_EMPLOYEE_LIMIT = 10

  def get_hierarchy
    [manager, director, vp]
  end

  #TODO: We have to add roles types
  def get_subordinates
    self.class.where('ceo_id=? OR vp_id=? OR director_id=? OR manager_id=?', id, id, id, id)
  end

  def self.get_top_employees
    order(salary: :desc).limit(TOP_EMPLOYEE_LIMIT)
  end

end
