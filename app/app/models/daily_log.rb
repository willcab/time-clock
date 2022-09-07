class DailyLog < ApplicationRecord
  belongs_to :employee, dependent: :destroy
  has_one :check_in
  has_one :check_out
end
