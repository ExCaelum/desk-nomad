require "rails_helper"

RSpec.feature "User logss out" do
  scenario "logged in user log out" do
    User.create(first_name: "Roger",
              last_name: "Smith",
              email: "rsmith@gmail.com",
              username: "turing123",
              password: "password",
              password_confirmation: "password")

      visit login_path

      click_on "Login"
      fill_in "Username", with: "turing123"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_on "Login"

      within (".navbar") do
        expect(page).to have_content("Logged in as Roger")
      end

      within (".navbar") do
        expect(page).to have_content("Logout")
      end

      click_on "Logout"

      within (".navbar") do
        expect(page).to have_content("Sign In")
      end

      within (".navbar") do
        expect(page).to have_no_content("Logged in as Roger")
      end
    end
  end
