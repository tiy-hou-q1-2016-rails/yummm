require "test_helper"

class CreateRecipeTest < Capybara::Rails::TestCase

  setup do
    Category.create! name: "delicious tacos"
  end

  test "can create a recipe" do
    visit root_path
    click_link "All Recipes"

    fill_in :passcode, with: "yolo"
    click_button "Sign In"
    click_link "add"

    within("#new_recipe") do
      fill_in "Name", with: "Tacos"
      fill_in "Ingredients", with: "The Ingredients"
      fill_in "Method", with: "The Method"
      fill_in "Description", with: "The Description"

      select("delicious tacos", from: "Category")
      attach_file('Photo', "#{Rails.root}/test/fixtures/tacos.jpg")
      click_button "Create Recipe"
    end

    ## Assert that this passed
    # 1. visit recipes_path and check if "Tacos"
    # 2. Recipe.find_by name: "Tacos"

    visit recipes_path
    assert_content page, "Tacos"

  end

end
