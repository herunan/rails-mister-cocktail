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

# mojito = URI.open('https://images.pexels.com/photos/1146754/pexels-photo-1146754.jpeg')
# gin_tonic = URI.open('https://images.pexels.com/photos/1170599/pexels-photo-1170599.jpeg')
# moscow_mule = URI.open('https://images.unsplash.com/photo-1530991808291-7e157454758c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9')

Cocktail.create([
  {
    name: "Mojito",
    description: "Irresistibly fresh and punchy, this authentic mojito cocktail recipe is a one-way salsa dance to Cuba.",
    method: "Muddle the lime juice, sugar and mint leaves in a small jug, crushing the mint as you go – you can use the end of a rolling pin for this. Pour into a tall glass and add a handful of ice. \n\n Pour over the rum, stirring with a long-handled spoon. Top up with soda water, garnish with mint and serve.",
  },
    {
    name: "Gin & Tonic",
    description: "It is almost impossible to imagine, let alone find a more quintessential pairing across any spirit category than the Gin & Tonic.",
    method: "The Spanish use a copa glass to serve gin and tonic - it's a big balloon glass that lets the wonderful aromas of the drink's botanicals be released, adding an extra level of flavour. At home, a large wine glass is a perfectly fine substitute. \n\nAdd the ice first; ideally, they will be large, clear cubes and you should have plenty of them - the more ice, the less likely they are to melt and dilute your drink. \n\nPour over a measure of gin followed by three times as much of the tonic water. \n\nAs lime is a sweet citrus fruit, it works really well with a typical gin and tonic. It's the oils in the rind we're after here, rather than the juice of the fruit, so peel a strip from the outside, twist it over the top of the glass to spritz the oil into the drink, then drop into the glass. \n\nDrink from the glass instead of through a straw to ensure you get the full flavour experience.",  },
    {
    name: "Moscow Mule",
    description: "Though the Moscow Mule might not be a cocktailian masterpiece, it can be (provided you use a good, spicy ginger beer) a refreshing quaff, indeed.",
    method: "Squeeze lime juice into a Moscow Mule mug (or a Collins glass) and drop in the spent shell. \n\nAdd 2 or 3 ice cubes, then pour in the vodka and fill with cold ginger beer (not ginger ale, although what the hell). \n\nServe with a stirring rod.",
  },
])

# Cocktail.first.photo.attach(io: mojito, filename: 'mojito.jpg', content_type: 'image/jpg')
# Cocktail.second.photo.attach(io: gin_tonic, filename: 'gin_tonic.jpg', content_type: 'image/jpg')
# Cocktail.third.photo.attach(io: moscow_mule, filename: 'moscow_mule.jpg', content_type: 'image/jpg')
