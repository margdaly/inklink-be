# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Artist.destroy_all

Artist.create!(name: "Bob Ross", email: "bob@gmail.com", password: "password", password_confirmation: "password", styles: ["American Traditional", "Watercolor"], pricing: "$")
Artist.create!(name: "Jimmy Johns", email: "sandwhich@ymail.com", password: "password1", password_confirmation: "password1", styles: ["Watercolor", "Black and Gray"], pricing: "$$")

Artist.create!(name: "Kermit", email: "frog@sesstreet.com", password: "password", password_confirmation: "password", styles: ["Geometric", "Black and Gray", "American Traditional"], pricing: "$$$")
Artist.create!(name: "Joe King", email: "hahaha@hotmail.com", password: "password", password_confirmation: "password", styles: ["Script", "Realism"], pricing: "$")

Artist.create!(name: "Tattoo Guy", email: "wowzers@gmail.com", password: "password", password_confirmation: "password", styles: ["Tribal", "Chicano", "Black and Gray"], pricing: "$$")
Artist.create!(name: "Bruce Campbell", email: "ashwilliams@yahoo.com", password: "password", password_confirmation: "password", styles: ["Irezumi"], pricing: "$$$")

Artist.create!(name: "Winston Bishop", email: "email@email.com", password: "password", password_confirmation: "password", styles: ["New School", "Chicano"], pricing: "$")
Artist.create!(name: "John John Jr.", email: "john@gmail.com", password: "password", password_confirmation: "password", styles: ["Black and Gray", "Script"], pricing: "$$")

Artist.create!(name: "Sailor Jerry", email: "jerry@gmail.com", password: "password", password_confirmation: "password", styles: ["American Traditional", "Tribal"], pricing: "$$$")
Artist.create!(name: "Sailor Moon", email: "moon@email.com", password: "password", password_confirmation: "password", styles: ["Geometric", "Realism", "Dragon Style"], pricing: "$")