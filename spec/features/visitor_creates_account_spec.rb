require 'rails_helper'

RSpec.feature "Visitor Creates Account" do
  scenario "visitor creates account; sees user dasboard" do

    visit login_path

    click_on "Create Account"
    fill_in :first_name, with: "Roger"
    fill_in :last_name, with: "Smith"
    fill_in :email, with: "rsmith@gmail.com"
    fill_in :username, with: "turing123"
    fill_in :password, with: "password"
    fill_in :password_confirmation, with: "password"
    click_on "Create Account"


    expect(page).to have_xpath("//dashboard")
    # Then my current page should be "/dashboard"

    within (".navbar") do
      expect(page).to have_content("Logged in as Roger")
    end

    within (".navbar") do
      expect(page).to have_content("Logout")
    end

    within (".navbar") do
      expect(page).to have_no_content("Login")
    end
  end
end

# As a visitor
# When I visit "/login
# And when I click link "Create Account"
# And I fill in my desired credentials
# And I submit my information
# Then my current page should be "/dashboard"
# And I should see a message in the navbar that says "Logged in as SOME_USER"
# And I should see my profile information
# And I should not see a link for "Login"
# And I should see a link for "Logout"
