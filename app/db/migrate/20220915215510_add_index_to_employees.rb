class AddIndexToEmployees < ActiveRecord::Migration[7.0]
  def change
  	add_index :employees, "id_employee", unique: true
  end
end
