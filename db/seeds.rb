# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# GETTING INGREDIENTS FROM LE WAGON API ==============================

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
data = JSON.parse(user_serialized)

# DESTROY DATABASE ===========================================

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

# Create all ingredients

data['drinks'].each do |drink|
  name = drink["strIngredient1"]
  Ingredient.create(name: name)
end

# Create cocktails

Cocktail.create!(name: 'gin tonic', url:'https://picsum.photos/300/300')
Cocktail.create!(name: 'vodka orange', url:'https://picsum.photos/301/301')
Cocktail.create!(name: 'vodka pomme', url:'https://picsum.photos/302/302')
Cocktail.create!(name: 'whisky sour', url:'https://picsum.photos/303/303')


# Create dose with association with cocktail & ingredient

dose = Dose.new(description: "2cl");
dose.ingredient = Ingredient.last
dose.cocktail = Cocktail.last

dose.save

puts "Ingredients: #{Ingredient.count} in database"
puts "Cocktails: #{Cocktail.count} in database"
puts "Doses: #{Dose.count} in database"
