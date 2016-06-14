require 'rails_helper'

RSpec.feature "User can checkout" do
  scenario "Authenticated user can checkout and create an order" do
    create_user

    category = create_category
    property0, property1 = create_property(2)
    category.properties << property0
    category.properties << property1

    visit "/properties"
    click_link "Property0"
    expect(current_path).to eq(property_path(property0))
    click_link "Book It!"
    expect(page).to have_content("You have booked 1 space.")
    click_link "Sign In"
    expect(current_path).to eq(login_path)

    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Roger")

    click_link "Bookings"
    expect(current_path).to eq("/cart")
    click_link "Checkout"
    expect(current_path).to eq("/orders")
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Order ##{Order.first.id}")
  end
end
