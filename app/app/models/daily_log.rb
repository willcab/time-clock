class DailyLog < ApplicationRecord
  belongs_to :employee
  scope :search_by_month, -> (month) { where( "EXTRACT(MONTH FROM day) = ?", month ) }
  scope :search_by_day, -> (day) { where( "EXTRACT(DAY FROM day) = ?", day ) }
end
