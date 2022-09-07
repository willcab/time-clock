class CreateCheckOuts < ActiveRecord::Migration[7.0]
  def change
    create_table :check_outs do |t|
      t.integer :hour
      t.integer :minutes
      t.references :daily_log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
