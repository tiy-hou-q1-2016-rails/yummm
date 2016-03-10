require "test_helper"

class CanSignInTest < Capybara::Rails::TestCase

  setup do
    User.create! name: "Bob", email: "bob@example.com", password: "12345678"
  end

  test "Can signin with all caps email" do
    visit root_path

    click_link "All Recipes"
    fill_in "Email", with: "BOB@EXAMPLE.COM"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Hello Bob!"
  end

  test "Can press submit on sign up without fields" do

    visit root_path

    click_link "All Recipes"
    click_button "Sign In"

    assert_content page, "Sign In"
  end

  test "Can sign Up" do
    visit root_path

    click_link "All Recipes"
    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Hello Bob!"
  end

end
