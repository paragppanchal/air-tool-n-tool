require 'faker'

puts 'creating 10 users'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )
  user.save!
end

puts 'Finished!!!'
