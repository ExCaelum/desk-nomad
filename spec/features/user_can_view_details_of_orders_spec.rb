require "rails_helper"

RSpec.feature "User sees details for an order" do
  scenario "User sees details about a specific order" do
    user = create_user

    property0, property1 = create_property(2)

    visit "/properties"

    click_link "Property0"

    expect(current_path).to eq(property_path(property0))

    click_link "Book It!"

    expect(page).to have_content("You have booked 1 space.")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Roger")

    click_link "Bookings"

    expect(current_path).to eq("/cart")

    click_link "Checkout"

    expect(current_path).to eq("/charges/new")
  end
end
