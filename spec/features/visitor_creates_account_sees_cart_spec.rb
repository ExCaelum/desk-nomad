require "rails_helper"

RSpec.feature "visitor creates account, sees cart" do
  scenario "visitor creates account to checkout" do
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

    click_on "Login or Create Account to Purchase"

    click_on "Create Account"

    fill_in "First name", with: "Roger"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "rsmith@gmail.com"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Create Account"

    expect(page).to have_content("Bookings: 1")

    click_on "Logout"

    within (".navbar") do
      expect(page).to have_content("Sign In")
    end

    within (".navbar") do
      expect(page).to have_no_content("Logged in as Roger")
    end
  end
end
