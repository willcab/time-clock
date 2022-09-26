class ChangeDailyLog < ActiveRecord::Migration[7.0]
  def change
    rename_column :daily_logs, :checkIn, :check_in
    rename_column :daily_logs, :checkOut, :check_out
  end
end
