# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({ username: 'test', password: 'password' })
user2 = User.create({ username: 'ryan', password: 'password' })

bench1 = Bench.create(
  {
    description: 'This is the very first bench',
    lat: 37.779597,
    lng: -122.413691
  }
)
