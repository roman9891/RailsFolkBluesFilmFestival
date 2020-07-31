# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'mini_magick'

User.destroy_all
Movie.destroy_all
Comment.destroy_all
Showing.destroy_all



10.times do 
    hero = ["accepted","rejected","pending"].sample
    u1 = User.create(name: Faker::JapaneseMedia::SwordArtOnline.real_name, 
        email: Faker::Internet.unique.email, 
        password: "funnycat83")
    m1 = Movie.create(
        title: Faker::Movie.title, 
        url: '<iframe src="https://player.vimeo.com/video/209913748?title=0&byline=0&portrait=0" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
        <p><a href="https://vimeo.com/209913748">Adele Radio City</a> from <a href="https://vimeo.com/user7917232">Es Devlin</a> on <a href="https://vimeo.com">Vimeo</a>.</p>', 
        is_mature: true,
        user: User.all.sample,
        description: Faker::Lorem.paragraphs(number: 1, supplemental: true).join,

        acceptance_status: hero,
        )
       
        m1.poster.attach(io: open("https://theposterdb.com/api/assets/"+(rand(17092..17104).to_s)), filename: 'file.jpg')
        puts "attached poster"
        u1.avatar.attach(io: open("https://loremflickr.com/500/600/marvel"), filename: 'file.jpg')
        puts "attached avatar"
    s1 = Showing.create(time: Faker::Time.between(from: Date.today, to: Date.today + 7), movie: Movie.all.sample)
    c1 = Comment.create(comment_text: Faker::Quotes::Shakespeare.hamlet_quote, user: User.first, showing: Showing.all.sample)
end

admin_user = User.create(name: "Roman", email: "admin@admin", password: "roman1", is_admin: true)
