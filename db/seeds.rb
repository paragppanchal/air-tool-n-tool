require 'faker'

puts 'destroying current records...'
Tool.destroy_all
Booking.destroy_all
User.destroy_all

puts 'records destroyed !!'

#---------------------------------------------------------
  def create_user(email, password)
    user = User.new(
        email: email,
        password: password
    )
    user.save!
    return User.last
  end

#---------------------------------------------------------
  def create_tool(title, price, address, photo_url, user)
    tool = Tool.new(
        title: title,
        price_per_day: price,
        address: address,
        remote_photo_url: photo_url
      )
    tool.user = user
    tool.save!
    #puts tool.error.full_messages
    return Tool.last
  end
#-----------------------------------------------------

# ------------ Create Users ---------------
puts 'creating 3 users...'

  user1 = create_user('parag@gmail.com', 'password')
  user2 = create_user('edward@gmail.com', 'password')
  user3 = create_user('joy@gmail.com', 'password')
  users = User.all
puts 'users created!'

#----------- Create Tools ---------------------

puts 'creating 10 tools...'

# pile_of_images = [
#   'https://source.unsplash.com/collection/427448/1600x900'
# ]

tool_images = [
                'https://source.unsplash.com/CuDoRFyTkAQ/1600x900',
                'https://source.unsplash.com/pVHz7BNe1nA/1600x900',
                'https://source.unsplash.com/CXlls8jm1VI/1600x900',
                'https://source.unsplash.com/U4CHIP7oMIs/1600x900',
                'https://source.unsplash.com/r427ZzVVbwU/1600x900',
                'https://source.unsplash.com/3GZi6OpSDcY/1600x900',
                'https://source.unsplash.com/WRgKwttuP7A/1600x900',
                'https://source.unsplash.com/fHaGwgBRBxw/1600x900',
                'https://source.unsplash.com/dod-BrjbRhY/1600x900',
                'https://source.unsplash.com/60krlMMeWxU/1600x900'
              ]


address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool1 = create_tool('Drill', 15.0, address, tool_images[0], user1)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool2 = create_tool('Hammer', 10.0, address, tool_images[1], user2)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool3 = create_tool('Circular Saw', 15.0, address, tool_images[2], user3)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool4 = create_tool('Woodcutter Saw', 25.0, address, tool_images[3], user1)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool5 = create_tool('Oscilloscope', 45.0, address, tool_images[4], user2)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool6 = create_tool('Multimeter', 22.0, address, tool_images[5], user3)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool7 = create_tool('Grinder', 30.0, address, tool_images[6], user1)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool8 = create_tool('Welding Machine', 50.0, address, tool_images[7], user2)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool9 = create_tool('Spanner', 7.0, address, tool_images[8], user3)
sleep(2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool10 = create_tool('Toolbox', 40.0, address, tool_images[9], user1)
sleep(2)

tools = Tool.all
puts 'tools created!'


# 10.times do
#   current_user = all_users.sample
#   tool = Tool.new(
#     title: Faker::Appliance.equipment,
#     price_per_day: Faker::Number.decimal(2),
#     address: ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121"),
#     # photo: 'image/upload/v1534401834/olynuyykhphjm50rcdr6.png'
#     remote_photo_url: pile_of_images.sample
#     )
#   tool.user = current_user
#   tool.save
#   puts tool.errors.full_messages
# end

#---------------- Create Bookings ---------------------

puts 'creating 5 bookings...'

5.times do
  date = Faker::Date.between(Date.today, 60.day.from_now)
  booking = Booking.new(
      start_date: date,
      end_date:   date
    )
  booking.user = users.sample
  booking.tool = tools.sample
  booking.save!
end

puts 'bookings created!'
puts '*** Finished !! ***'

