# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create!(email: "test@test.com", password: "12345678", password_confirmation: "12345678", first_name: "Zaid", last_name: "Kharbe")

puts "1 User created"
AdminUser.create!(email: "admin@test.com", password: "12345678", password_confirmation: "12345678", first_name: "Naufil", last_name: "Kharbe")


100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"	