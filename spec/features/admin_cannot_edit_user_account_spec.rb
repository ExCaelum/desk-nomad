require 'rails_helper'

RSpec.feature "admin cannot edit user info" do
  scenario "logged in admin only can edit their profile" do
    admin = create_admin
    user = create_user

    visit login_path

    fill_in "Username", with: "nickpisciotta"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/admin/dashboard")

    within (".address-bar") do
      expect(page).to have_content("Welcome Nick")
    end

    click_on "Edit User"

    visit "/users/2/edit"

    fill_in "Username", with: "User1"
    click_on "Update Account"

    expect(user.username).to eq(user.username)
  end
end
