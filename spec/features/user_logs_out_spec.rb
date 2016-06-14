require "rails_helper"

RSpec.feature "User logs out" do
  scenario "logged in user logs out" do
<<<<<<< HEAD
    create_user
=======
    user = create_user
>>>>>>> second-dev

    visit login_path

    click_on "Login"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    within (".address-bar") do
      expect(page).to have_content("Welcome Roger")
    end
<<<<<<< HEAD

    within (".navbar") do
      expect(page).to have_content("Logout")
    end

    click_on "Logout"

    within (".navbar") do
      expect(page).to have_content("Sign In")
    end

    within (".navbar") do
=======

    within (".navbar") do
      expect(page).to have_content("Logout")
    end

    click_on "Logout"

    within (".navbar") do
      expect(page).to have_content("Sign In")
>>>>>>> second-dev
      expect(page).to have_no_content("Logged in as Roger")
    end
  end
end
