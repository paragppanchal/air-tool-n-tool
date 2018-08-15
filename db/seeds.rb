require 'faker'

puts 'creating 10 users'
User.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )
  user.save!
end

puts 'Finished!!!'

all_users = User.all

puts 'creating 10 tools'
Tool.destroy_all

10.times do
  current_user = all_users.sample
  tool = Tool.new(
    title: Faker::Appliance.equipment,
    price_per_day: Faker::Number.decimal(2),
    address: ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
    )
  tool.user = current_user
  tool.save
  puts tool.errors.full_messages
end

puts 'Finished!!!'
