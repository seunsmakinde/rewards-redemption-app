# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

puts "Clearing existing data..."
Redemption.destroy_all
Reward.destroy_all
User.destroy_all

puts "Creating users..."
users = User.create!([
  { name: "Alice", points: 150 },
  { name: "Bob", points: 100 },
  { name: "Charlie", points: 75 }
])

puts "Creating rewards..."
rewards = Reward.create!([
  { title: "Free Coffee", cost: 50 },
  { title: "Movie Ticket", cost: 100 },
  { title: "Gift Card", cost: 150 }
])

puts "Creating redemptions..."
Redemption.create!([
  { user: users[0], reward: rewards[0] }, # Alice redeems Free Coffee
  { user: users[1], reward: rewards[0] }, # Bob redeems Free Coffee
  { user: users[1], reward: rewards[1] }  # Bob redeems Movie Ticket
])

puts "Seeding complete!"

