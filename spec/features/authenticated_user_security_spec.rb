require "rails_helper"

RSpec.feature "Authorized user doesn't have acesss to another user's data" do
  scenario "user cannot view another user's orders" do
    user_one = create_user
    user_two = create_second_user
    user_two_order = user_two.orders.new(status: "ordered")
    user_two_order.save

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_one)

    visit "/orders"
    expect(page).to have_content("Welcome Roger")
    expect(page).to_not have_content("Order #1")

    visit "/orders/1"
    expect(page).to_not have_content("Order #1")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "user cannot access admin functionality/views" do
    user = create_user

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/admin"

    expect(page).to have_content("Error 404")
  end

  scenario "user cannot create admin account" do
    user = create_user

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/users/new"

    expect(page).to_not have_content("role")

    visit "/admin/new"

    expect(current_path).to eq("/")
  end
end
