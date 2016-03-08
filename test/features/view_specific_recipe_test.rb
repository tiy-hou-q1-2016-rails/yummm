require "test_helper"

class ViewSpecificRecipeTest < Capybara::Rails::TestCase

  setup do

    cat = Category.create! name: "Yolo"
    Recipe.create! category: cat, name: "Cornmeal Pancakes", description: "The Description", ingredients: "The Ingredients", method: "The Method"

  end

  test "view recipe" do
    visit root_path
    assert_content page, "Yummmm"
    click_link "All Recipes"
    click_link "Cornmeal Pancakes"
    assert_content page, "Ingredients"
  end

  test "increases view count" do
    recipe = Recipe.first
    #do something
    original_count = recipe.view_count
    3.times do
      visit recipe_path(id: recipe.id)
    end
    # assert if correct
    assert_content page, "Recipe has been viewed 3 times"

  end
end
