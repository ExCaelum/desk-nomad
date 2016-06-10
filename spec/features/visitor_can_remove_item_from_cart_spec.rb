require "rails_helper"

RSpec.feature "visitor removes property" do
  scenario "visitor can remove an property from their cart" do
    property1, property2 = create_property(2)

    visit property_path(property1)
    click_on "Book It!"
    click_on "Bookings"
    expect(page).to have_content(property1.title)

    click_on "Remove Property"
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Successfully removed #{property1.title} from your cart.")
    expect(page).to have_link(property1.title)

    expect(page).to have_content("Your Cart")
    expect(page).to_not have_content("#{property1.state} - $property1.price/Day")
  end
end
