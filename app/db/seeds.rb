# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
unless Store.any?
  company_branchs=Array.new(5){{name: Faker::Company.name, address: Faker::Address.full_address }}
  Store.create(company_branchs)
end

companys=Store.all

companys.each do |company|
 10.times do
  name=Faker::Name.name_with_middle
  emp=Employee.create(name: name, email: Faker::Internet.email(name: name.split(' ')[0]), position: Faker::Job.position, id_employee: Faker::Number.number(digits: 5), private_number: Faker::Number.number(digits: 5), store: company)
  DailyLog.create!(day: Date.current, check_in:'05:30:00', check_out:'10:30:00',employee:emp)
 end

end
