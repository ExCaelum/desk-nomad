require "rails_helper"

RSpec.feature "Unauthorized user doesn't have acesss to another user's data" do
  scenario "visitor cannot view user dashboard page" do
    visit root_path

    visit ("/dashboard")

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "visitor cannot view another user's orders" do
    visit ("/orders")

    expect(current_path).to eq("/")
  end

  scenario "visitor is directed to login/create account before checkout" do
    category = create_category
    property1, property2 = create_property(2)
    category.properties << property1

    visit property_path(property1)
    click_on "Book It!"
    click_on "Bookings"

    expect(page).to have_content(property1.title)
    expect(page).to have_content("Bookings: 1")

    within("ul#user_checkout_message") do
      expect(page).to have_no_content("Checkout")
    end

    within("ul#user_checkout_message") do
      expect(page).to have_content("Login or Create Account to Purchase")
    end
  end

  scenario "visitor cannot access admin functionality/views" do
    visit "/admin"

    expect(page).to have_content("Error 404")
  end

  scenario "visitor cannot create admin account" do
    visit "/users/new"

    expect(page).to_not have_content("role")

    visit "/admin/new"

    expect(current_path).to eq("/")
  end
end
