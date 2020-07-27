# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Movie.destroy_all
Comment.destroy_all
Showing.destroy_all

u1 = User.create(name: "roman", email: "realemail@email.com", password: "funnycat83")
m1 = Movie.create(name: "Big Romanowski", url: "www.youtube.come/whatever", is_mature: true, acceptance_status: "accepted", user: u1)