require "rails_helper"

RSpec.feature "Authorized user doesn't have acesss to another user's data" do
  scenario "user cannot view another user's orders" do
    user_one = create_user
    user_two = create_second_user
    user_two_order = user_two.orders.new(status: "ordered")
    user_two_order.save

    visit login_path

    click_on "Login"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/dashboard")

    visit "/orders"
    expect(page).to have_content("Welcome Roger")
    expect(page).to_not have_content("Order #1")

    visit "/orders/1"
    expect(page).to_not have_content("Order #1")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "user cannot access admin functionality/views" do
    create_user

    visit login_path

    click_on "Login"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/dashboard")

    visit "/admin"

    expect(page).to have_content("Error 404")
  end

  scenario "user cannot create admin account" do
    create_user

    visit login_path

    click_on "Login"
    fill_in "Username", with: "turing123"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq("/dashboard")

    visit "/users/new"

    expect(page).to_not have_content("role")

    visit "/admin/new"

    expect(current_path).to eq("/")
  end
end
