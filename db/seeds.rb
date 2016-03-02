if Recipe.count == 0
  # Taco

    taco = Recipe.new
    taco.name = "Puffy Tacos"
    taco.description = "A JWo favorite. The tortillas: they are puffy!"
    taco.ingredients = <<-EORECIPE
2 cups of masa harina
1 1/4 cups of water
1/4 teaspoon of salt
1 quart of peanut or canola oil
EORECIPE
    taco.method = <<-EORECIPE
    Mix masa harina, water and salt together until it forms into a soft ball. If it’s too dry, add a bit more water a tablespoon at a time.
    Divide dough into 16 equal balls, and press out with a tortilla press or roll out with a rolling pin.
    Keep pressed discs covered with a damp cloth.
    Heat up two inches of oil in a pot or skillet to 350 degrees.
    Gently place a disc in the hot oil and it should immediately start to puff. After five seconds, with a spatula, make an indention in the center so it forms a V shape.
    Gently cook the shell on each side until light brown and crispy (about 20 seconds for each side).
    Remove from oil and drain on a paper towel.
    Stuff with spicy ground beef, shredded iceberg lettuce, diced tomatoes, grated cheddar and salsa and serve immediately.
    Makes 16 tacos.
EORECIPE
    taco.photo_url = "http://3.bp.blogspot.com/_eOBTgTn007E/Rn_Bu7YmhzI/AAAAAAAAATo/ED03C53YYDc/s400/taco2DSC_3926.JPG"

    taco.save
  # Pancake

    pancake = Recipe.new
    pancake.name = "Cornmeal Pancakes"
    pancake.ingredients = """
    1-1/2 cup (scant) All-purpose Flour
1-1/2 cup Heaping Yellow Cornmeal
1/2 teaspoon Salt
3 Tablespoons Baking Powder
4 Tablespoons Sugar
2-1/4 cups Whole Milk (more If Needed)
2 whole Large Eggs
3 teaspoons Vanilla
4 Tablespoons Butter, Melted
"""
    pancake.method = """
Mix together flour, cornmeal, salt, baking powder, and sugar in a bowl. Set aside.

In a separate bowl, mix milk, eggs, and vanilla. Pour into the dry ingredients, stirring gently.

Stir in melted butter. Set batter aside. If batter is overly thick, splash in a small amount of milk.

Heat 1 tablespoon butter in a skillet over medium-low heat. When heated, drop 1/4 cup batter per pancake and cook until golden brown on both sides. Remove from skillet and set aside.

Stack three pancakes, placing a pat of butter between each pancake.
    """
    pancake.photo_url = "https://pioneerwoman.files.wordpress.com/2012/05/cornmealpancakes21.jpg?w=780"

    pancake.save
end
