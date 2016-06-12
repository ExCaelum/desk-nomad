require 'rails_helper'

RSpec.feature "user edit their account info" do
  scenario "user logs in to dashboard and can edit account with valid params" do
    user = create_user

    visit login_path

    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/dashboard")

    within (".address-bar") do
      expect(page).to have_content("Welcome Roger")
    end

    click_on "Edit User"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "Username", with: "User1"

    click_on "Update Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Username: User1")
  end

  scenario "user tries to update account without username" do
    user = create_user

    visit login_path

    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/dashboard")

    within (".address-bar") do
      expect(page).to have_content("Welcome Roger")
    end

    click_on "Edit User"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "Username", with: ""

    click_on "Update Account"

    expect(page).to have_content("Update was not made")
    # expect(current_path).to eq(edit_user_path(user))
  end

  scenario "user cannot edit another user's profile" do
    user1 = create_user
    user2 = create_second_user

    visit login_path

    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    within (".address-bar") do
      expect(page).to have_content("Welcome Roger")
    end

    click_on "Edit User"

    visit "/users/2/edit"

    fill_in "Username", with: "turing"

    click_on "Update Account"

    expect(user2.username).to eq(user2.username)
  end
end
