require 'rails_helper'

RSpec.feature "User can checkout" do
  scenario "Authenticated user can checkout and create an order" do
    User.create(first_name: "Roger",
              last_name: "Smith",
              email: "rsmith@gmail.com",
              username: "turing123",
              password: "password",
              password_confirmation: "password")
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
    fill_in "Password confirmation", with: "password"
    click_on "Login"
    expect(page).to have_content("Hello Roger")
    click_link "Bookings"
    expect(current_path).to eq("/cart")
    click_link "Checkout"
    expect(current_path).to eq("/orders")
    save_and_open_page
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Order ##{Order.first.id}")
  end
end

# class UserCanCheckoutTest < ActionDispatch::IntegrationTest
#   test "checking out creates an order and order items" do
#     create_categories
#     create_items
#     create_user
#     visit "/items"
#     click_on "Add to Cart"
#
#     find(:xpath, "//a[@href='/cart']").click
#     click_on "Login"
#     fill_in "E-Mail", with: User.first.email
#     fill_in "Password", with: "password"
#     click_on "Log in"
#     assert_equal "/cart", current_path
#     click_on "Place Order"
#     assert_equal "/orders", current_path
#     assert page.has_content? "Order was successfully placed"
#     order = Order.first
#     assert page.has_content? "Order number : #{order.id}"
#   end
# end
