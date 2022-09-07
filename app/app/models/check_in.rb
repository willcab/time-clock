class CheckIn < ApplicationRecord
  belongs_to :daily_log, dependent: :destroy
end
