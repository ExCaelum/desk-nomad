require 'rails_helper'

RSpec.feature "display cart contents" do
  scenario "as spaces are booked, cart total increases" do
    category = Category.create(title: "Work Space", slug: "work-space")
    create_property(1)
    space = Property.find(1)

    category.properties << space

    visit property_path(space)

    expect(page).to have_content(space.title)

    click_on "Book It!"

    expect(page).to have_content("You have booked 1 space")
    expect(page).to have_content("Bookings: 1")

    click_on "Book It!"

    expect(page).to have_content("You have booked 2 spaces")
    expect(page).to have_content("Bookings: 2")
  end

  # scenario "user can view items in cart" do
  #   space = create_property(1)
  #
  #   visit property_path(space)
  #
  #   expect(page).to have_content(space.title)
  #
  #   click_button "Book it"
  #
  #   click_button "Bookings"
  #
  #   expect(page).to have_content(space.description)
  #   expect(page).to have_content(space.price)
end
