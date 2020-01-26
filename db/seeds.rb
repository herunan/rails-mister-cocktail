# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
Cocktail.destroy_all

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
    method: "Muddle the lime juice, sugar and mint leaves in a small jug, crushing the mint as you go – you can use the end of a rolling pin for this. Pour into a tall glass and add a handful of ice. \n\n Pour over the rum, stirring with a long-handled spoon. Top up with soda water, garnish with mint and serve.",
    image: "https://images.pexels.com/photos/1146754/pexels-photo-1146754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h="
  },
    {
    name: "Gin & Tonic",
    description: "It is almost impossible to imagine, let alone find a more quintessential pairing across any spirit category than the Gin & Tonic.",
    image: "https://images.pexels.com/photos/1170599/pexels-photo-1170599.jpeg?auto=compress&cs=tinysrgb&dpr=2&h="
  },
    {
    name: "Moscow Mule",
    description: "Though the Moscow Mule might not be a cocktailian masterpiece, it can be (provided you use a good, spicy ginger beer) a refreshing quaff, indeed.",
    image: "https://images.unsplash.com/photo-1530991808291-7e157454758c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&h="
  },
])
