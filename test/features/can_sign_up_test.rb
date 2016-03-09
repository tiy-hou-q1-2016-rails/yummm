require "test_helper"

class CanSignUpTest < Capybara::Rails::TestCase

  test "can signup a new account" do

    visit root_path
    visit recipes_path
    click_link "Sign Up"

    within("#new_user") do
      fill_in "Email", with: "newuser@example.com"
      fill_in "Password", with: "12345678"
      fill_in "Name", with: "Bob"
      click_button "Create User"
    end

    assert_content page, "Hello Bob!"

  end
end
