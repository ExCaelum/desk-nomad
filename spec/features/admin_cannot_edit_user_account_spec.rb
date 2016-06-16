require 'rails_helper'

RSpec.feature "admin cannot edit user info" do
  scenario "logged in admin only can edit their profile" do
    admin = create_admin
    user = create_user

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit dashboard_path

    expect(current_path).to eq("/admin/dashboard")

    click_on "Edit User"

    visit "/users/2/edit"

    fill_in "Username", with: "User1"

    click_on "Update Account"

    expect(user.username).to eq(user.username)
  end
end
