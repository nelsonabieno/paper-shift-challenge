# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Location.destroy_all

User.create(name: 'Joe', email: 'joedoe@gmail.com')
Event.create(starts_at: Time.now, ends_at: Time.now+5)
Location.create(name: 'Berlin')
