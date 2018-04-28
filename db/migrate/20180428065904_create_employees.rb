class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :emp_id
      t.integer :salary
      t.integer :ratings
      t.datetime :date_of_joining
      t.integer :ceo_id
      t.integer :vp_id
      t.integer :director_id
      t.integer :manager_id

      t.timestamps
    end
    add_index :employees, :ceo_id
    add_index :employees, :vp_id
    add_index :employees, :director_id
    add_index :employees, :manager_id
  end
end
