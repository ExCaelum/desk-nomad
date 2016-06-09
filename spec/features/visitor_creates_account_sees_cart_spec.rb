require "rails_helper"

RSpec.feature "visitor creates account, sees cart" do
  scenario "visitor creates account to checkout" do
    category = Category.create(title: "Work Space", slug: "work-space")
    property1, property2 = create_property(2)
    category.properties << property1

    visit property_path(property1)
    click_on "Book It!"
    click_on "Bookings"

    expect(page).to have_content(property1.title)
    expect(page).to have_content("Bookings: 1")

    within("li#user_checkout_message") do
      expect(page).to have_no_content("Checkout")
    end

    click_on "Login or Create Account to Checkout"

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

# As a visitor when I have items in my cart
# And when I visit "/cart"
# I should not see an option to "Checkout"
# I should see an option to "Login or Create Account to Checkout"
# After I create an account
# And I visit "/cart
# Then I should see all of the data that was there when I was not logged in
# When I click "Logout"
# Then I should see see "Login"
# And I should not see "Logout"
