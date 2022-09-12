class Employee < ApplicationRecord
	validates  :name, presence: true
	validates  :email, presence: true, format:{ with: URI::MailTo::EMAIL_REGEXP}
	validates  :position, presence: true
	validates  :id_employee, presence: true
	validates  :private_number, presence: true

	belongs_to :store

end
