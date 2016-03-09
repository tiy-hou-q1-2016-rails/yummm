require "test_helper"

class ViewSpecificRecipeTest < Capybara::Rails::TestCase

  setup do

    cat = Category.create! name: "Yolo"


    # how to upload a file in a test
    recipe = Recipe.new category: cat, name: "Cornmeal Pancakes", description: "The Description", ingredients: "The Ingredients", method: "The Method"
    File.open("#{Rails.root}/test/fixtures/tacos.jpg", "rb") do |file|
      recipe.photo = file
    end
    recipe.save!

    User.create! name: "Bob", email: "bob@example.com", password: "12345678"

  end

  test "view recipe" do
    visit root_path
    assert_content page, "Yummmm"
    click_link "All Recipes"

    fill_in :email, with: "bob@example.com"
    fill_in :password, with: "12345678"
    click_button "Sign In"
    click_link "All Recipes"

    click_link "Cornmeal Pancakes"
    assert_content page, "Ingredients"
  end

  test "increases view count" do
    recipe = Recipe.first
    #do something
    original_count = recipe.view_count

    visit recipe_path(id: recipe.id)

    fill_in :email, with: "bob@example.com"
    fill_in :password, with: "12345678"
    click_button "Sign In"
    click_link "All Recipes"

    3.times do
      visit recipe_path(id: recipe.id)
    end
    # assert if correct
    assert_content page, "Recipe has been viewed 3 times"

  end
end
