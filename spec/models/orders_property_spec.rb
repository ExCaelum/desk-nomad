require "rails_helper"

RSpec.describe OrdersProperty, type: :model do
  it { should belong_to(:property) }
  it { should belong_to(:order) }

  scenario "the order_property calculates it total" do
    user = create_user

    property1, property2 = create_property(2)
    cart = Cart.new({property1.id => 1, property2.id => 2})
    order = Order.create(user_id: user.id)
    order_parser = OrderParser.new(cart, order)
    order_parser.confirm

    expect(OrdersProperty.first.total).to eq(10)
  end

  scenario "it can find the property it has" do
    user = create_user

    property1, property2 = create_property(2)
    cart = Cart.new({property1.id => 1, property2.id => 2})
    order = Order.create(user_id: user.id)
    order_parser = OrderParser.new(cart, order)
    order_parser.confirm

    expect(OrdersProperty.first.find_property.title).to eq("Property0")
  end
end
