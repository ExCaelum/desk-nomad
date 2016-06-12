require 'rails_helper'

RSpec.describe Order, type: :model do
  it {should validate_presence_of(:user_id)}
  it {should belong_to(:user)}
  it {should have_many(:orders_properties)}
  it {should have_many(:properties)}

  scenario "the order creates orders_properties" do
    user = User.create(first_name: "Roger",
              last_name: "Smith",
              email: "rsmith@gmail.com",
              username: "turing123",
              password: "password",
              password_confirmation: "password")

    property1, property2 = create_property(2)
    cart = Cart.new({property1.id => 1, property2.id => 2})
    order = Order.create(user_id: user.id)
    order.confirm_order(cart)

    expect(OrdersProperty.all.count).to eq(2)
  end

  scenario "the order finds its total" do
    user = User.create(first_name: "Roger",
              last_name: "Smith",
              email: "rsmith@gmail.com",
              username: "turing123",
              password: "password",
              password_confirmation: "password")

    property1, property2 = create_property(2)
    cart = Cart.new({property1.id => 1, property2.id => 2})
    order = Order.create(user_id: user.id)
    order.confirm_order(cart)

    expect(order.total).to eq(30)
  end
end
