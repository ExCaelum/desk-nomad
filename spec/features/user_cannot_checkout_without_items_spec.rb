require 'rails_helper'

RSpec.feature "User cannot checkout if cart is empty" do
  scenario "Cannot check out with an empty cart" do
    User.create(first_name: "Roger",
              last_name: "Smith",
              email: "rsmith@gmail.com",
              username: "turing123",
              password: "password",
              password_confirmation: "password")
    visit "/"
    click_link "Sign In"
    expect(current_path).to eq(login_path)

    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Roger")
    click_link "Bookings"
    expect(current_path).to eq("/cart")
    expect(current_path).to eq("/cart")
    expect(page).to have_content("Please Add Items to your Cart")
  end
end
