class AddStoreRefToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :store, null: false, foreign_key: true
  end
end
