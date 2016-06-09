require 'rails_helper'

RSpec.describe Cart, type: :model do
  scenario "property method returns property objects" do
    property1, property2 = create_property(2)

    cart = Cart.new({property1.id => 1, property2.id => 2})

    expect(cart.return_properties.first.title).to eq("Property0")
    expect(cart.return_properties.first.quantity).to eq(1)
    expect(cart.return_properties.second.total).to eq(20)
    expect(cart.return_properties.first.total).to eq(10)
  end

  scenario "cart total amount can be calculated" do
    property1, property2 = create_property(2)

    cart = Cart.new({property1.id => 1, property2.id => 2})

    expect(cart.cart_total).to eq(30)
  end

  scenario "total properties in cart can be calculated" do
    property1, property2 = create_property(2)

    cart = Cart.new({property1.id => 1, property2.id => 2})

    expect(cart.total_properties).to eq(3)
  end

  scenario "property totals increase as more are added" do
    property1, property2 = create_property(2)

    cart = Cart.new({})

    cart.add_property(property1.id)

    expect(cart.total_properties).to eq(1)
  end
end
