require "rails_helper"

RSpec.feature "User logs in" do
  scenario "existing user logs in" do
    user = create_user

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

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

  scenario "user attempts login with missing credentials" do
    create_user
  
    visit login_path

    click_on "Login"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: ""
    click_on "Login"

    expect(page).to have_content("Invalid Login")
  end
end
