# Create employees
ceo = Employee.new(name: 'CEO', emp_id: 1, salary: 100000, date_of_joining: Time.now)
ceo.save(validate: false)
vp = Employee.new(name: 'VP', emp_id: 1, salary: 10000, date_of_joining: Time.now, ceo_id: ceo.id)
vp.save(validate: false)
director = Employee.new(name: 'Director', emp_id: 1, salary: 1000, date_of_joining: Time.now, ceo_id: ceo.id, vp_id: vp.id)
director.save(validate: false)
manager = Employee.new(name: 'Manager', emp_id: 1, salary: 100, date_of_joining: Time.now, ceo_id: ceo.id, vp_id: vp.id, director_id: director.id)
manager.save(validate: false)
sde = Employee.new(name: 'SDE', emp_id: 1, salary: 100, date_of_joining: Time.now,  ceo_id: ceo.id, vp_id: vp.id, director_id: director.id, manager_id: manager.id)
sde.save(validate: false)

