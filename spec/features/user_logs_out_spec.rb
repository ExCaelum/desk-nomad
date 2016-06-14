require "rails_helper"

RSpec.feature "User logs out" do
  scenario "logged in user logs out" do
    user = create_user

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

    click_on "Logout"

    within (".navbar") do
      expect(page).to have_content("Sign In")
      expect(page).to have_no_content("Logged in as Roger")
    end
  end
end
