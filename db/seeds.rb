# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list' # Open it
ingredients_serialised = open(url).read # Pull the data as a string
ingredients = JSON.parse(ingredients_serialised) # Parse it into a Hash
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

Cocktail.create([
  {
    name: "Mojito",
    description: "Irresistibly fresh and punchy, this authentic mojito cocktail recipe is a one-way salsa dance to Cuba.",
    image: "https://images.pexels.com/photos/1146754/pexels-photo-1146754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h="
  },
    {
    name: "Gin & Tonic",
    description: "It is almost impossible to imagine, let alone find a more quintessential pairing across any spirit category than the Gin & Tonic.",
    image: "https://images.pexels.com/photos/1170599/pexels-photo-1170599.jpeg?auto=compress&cs=tinysrgb&dpr=2&h="
  }
])


