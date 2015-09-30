 require 'faker'

  # Create Users
  5.times do
    user = User.new(
      name:     Faker::Name.name, 
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10),
    )
    
  end
  
  users = User.all

  # Create Items
  30.times do
    Item.create!(
      user: users.sample,
      name: Faker::Lorem.sentence
    )
  end

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Item.count} items created"
