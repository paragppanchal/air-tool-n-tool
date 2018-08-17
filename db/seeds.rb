require 'faker'
# ------------ Create Users ---------------
puts 'creating 3 users...'
User.destroy_all

users = [ parag@gmail.com,
          edward@gmail.com,
          joy@gmail.com
        ]

  user1 = create_user(users[0], 'password')
  user2 = create_user(users[1], 'password')
  user3 = create_user(users[3], 'password')
  users = [ user1, user2, user3 ]
puts 'users created!'

#----------- Create Tools ---------------------

all_users = User.all

puts 'creating 10 tools...'
Tool.destroy_all

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

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool2 = create_tool('Hammer', 10.0, address, tool_images[1], user2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool3 = create_tool('Circular Saw', 15.0, address, tool_images[2], user3)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool4 = create_tool('Woodcutter Saw', 25.0, address, tool_images[3], user1)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool5 = create_tool('Oscilloscope', 45.0, address, tool_images[4], user2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool6 = create_tool('Multimeter', 22.0, address, tool_images[5], user3)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool7 = create_tool('Grinder', 30.0, address, tool_images[6], user1)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool8 = create_tool('Welding Machine', 50.0, address, tool_images[7], user2)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool9 = create_tool('Spanner', 7.0, address, tool_images[8], user3)

address = ((1..100).to_a.sample.to_s + " Stewart St, Melbourne VIC 3121")
tool10 = create_tool('Toolbox', 40.0, address, tool_images[9], user1)


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
tools = [ tool1, tool2, tool3, tool4, tool5, tool6, tool7, tool8, tool9, tool10 ]
puts 'tools created!'

#---------------- Create Bookings ---------------------

puts 'creating 5 bookings...'

5.times do

  booking = Booking.new(
      start_date: Faker::Date.between(Date.today, 5.day.from_now),
      end_date: :start_date
    )
  booking.user = users.sample
  booking.tool = tools.sample

end






puts '*** Finished !! ***'

#************************************************
  def create_user(email, password)
    user = User.new(
        email: Faker::Internet.email,
        password: password
    )
    user.save!
    return User.last
  end


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
