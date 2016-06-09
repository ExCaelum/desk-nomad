require "rails_helper"

RSpec.feature "User logs in" do
  scenario "existing user logs in" do
    create_user

    visit login_path

    click_on "Login"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    within (".address-bar") do
      expect(page).to have_content("Welcome Roger")
    end

    within (".navbar") do
      expect(page).to have_content("Logout")
    end

    within (".navbar") do
      expect(page).to have_no_content("Login")
    end
  end
end
