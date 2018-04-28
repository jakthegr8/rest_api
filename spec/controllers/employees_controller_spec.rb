require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  before do
    create_employees
    ceo = Employee.where(name: 'CEO').first
    vp = Employee.where(name: 'VP').first
    director = Employee.where(name: 'Director').first
    manager = Employee.where(name: 'Manager').first
    sde =Employee.where(name: 'SDE').first
  end

  context 'Get All Employee' do
    before { get :index }
    it 'Should return a json response' do
      #TODO: Move the JSON parsing and other stuffs to seperate helper methods
      expect(JSON.parse(response.body).collect { |e| e['id'] }).to match_array[ceo.id, vp.id, director.id, manager.id, sde.id]
    end
  end

  context 'Create Employee' do
    employee_params = {}
    before do
      post :create,  params: { employee: {
                                 name: 'Fake name' ,
                                 emp_id: 1,
                                 salary: 10,
                                 ratings: 3,
                                 date_of_joining: Time.now,
                                 ceo_id: ceo.id,
                                 vp_id: vp.id,
                                 director_id: director.id,
                                 manager_id: manager.id,

      }}
    end

    it 'Should create an employee' do
      # expect(JSON.parse(response.body)).to eq([])
    end
  end

  context 'Delete Employee' do

  end

  context 'Get Employee Hierarchy' do

  end

  context 'Get Employee Subordinates' do

  end

  context 'Get Top Employees' do
    it 'Should return the empty employees' do
      get :top_employees
      # expect(JSON.parse(response.body)).to eq([])
    end

    it 'Should return the 10 employees' do
      get :top_employees
      # expect(JSON.parse(response.body)).to eq([])
    end
  end

  # TODO: Move to helpers and add via factory_bot
  def create_employees
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
  end
end
