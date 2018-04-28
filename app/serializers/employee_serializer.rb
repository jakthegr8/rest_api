class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :emp_id, :salary, :ratings, :date_of_joining

  has_one :vp, class_name: "Employee", foreign_key: "vp_id"
  has_one :director, class_name: "Employee", foreign_key: "director_id"
  has_one :manager, class_name: "Employee", foreign_key: "manager_id"
end
