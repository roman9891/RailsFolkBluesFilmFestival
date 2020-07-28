# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Movie.destroy_all
Comment.destroy_all
Showing.destroy_all



10.times do 
    u1 = User.create(name: Faker::JapaneseMedia::SwordArtOnline.real_name, 
        email: Faker::Internet.unique.email, 
        password: "funnycat83")
    m1 = Movie.create(
        name: Faker::JapaneseMedia::SwordArtOnline.game_name, 
        url: "www.youtube.come/whatever", 
        is_mature: true, acceptance_status: "accepted", 
        user: User.all.sample)
end

s1 = Showing.create(time: Time.now, movie: Movie.all.sample)
c1 = Comment.create(comment_text: "woooooah", showing: s1, user: User.all.sample)
