class CreateDailyLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_logs do |t|
      t.integer :day
      t.string :month
      t.integer :year
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
