require 'rails_helper'

RSpec.feature "visitor adjusts cart quanitity" do
  scenario "vistor adds item to the cart and adjusts quantity" do
    property1, property2 = create_property(2)

    visit property_path(property1)
    click_on "Book It!"
    click_on "Bookings"

    within(".col-md-3") do
      expect(page).to have_content(property1.title)
    end

    expect(current_path).to eq(cart_path)

    select(2)
    click_on "Update Quantity"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Successfully updated quantity for Property0 to 2")
    within(".col-md-3") do
      expect(page).to have_content("2 Days")
      expect(page).to have_content("$20")
    end

    select(1)
    click_on "Update Quantity"

    expect(current_path).to eq(cart_path)
    within(".col-md-3") do
      expect(page).to have_content("1 Days")
      expect(page).to have_content("$10")
    end
  end
end
