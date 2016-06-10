require 'rails_helper'

RSpec.feature "display cart contents" do
  scenario "as spaces are booked, cart total increases" do
    category = create_category
    property1, property2 = create_property(2)

    category.properties << property1

    visit property_path(property1)

    expect(page).to have_content(property1.title)

    click_on "Book It!"

    expect(current_path).to eq(property_path(property1))
    expect(page).to have_content("You have booked 1 space")
    expect(page).to have_content("Bookings: 1")

    click_on "Book It!"

    expect(current_path).to eq(property_path(property1))
    expect(page).to have_content("You have booked 2 spaces")
    expect(page).to have_content("Bookings: 2")
  end

  scenario "user can view items in cart" do
    property1, property2 = create_property(2)

    visit property_path(property1)

    expect(page).to have_content(property1.title)

    click_on "Book It!"

    expect(current_path).to eq(property_path(property1))

    visit property_path(property2)

    click_on "Book It!"

    expect(current_path).to eq(property_path(property2))

    click_on "Bookings"

    expect(current_path).to eq("/cart")

    within(".col-md-3:first") do
      expect(page).to have_content(property1.title)
    end

    within(".col-md-3:first") do
      expect(page).to have_content(property1.price)
    end

    within(".col-md-3:nth-child(2)") do
      expect(page).to have_content(property2.title)
    end

    within(".col-md-3:nth-child(2)") do
      expect(page).to have_content(property2.price)
    end

    within(".intro-text") do
      expect(page).to have_content("$20")
    end

  end
end
