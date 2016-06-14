require 'rails_helper'

RSpec.describe OrderParser, type: :model do

  scenario "it returns false when the cart has contents" do
    cart = Cart.new({"1"=>1})
    cart_checker = OrderParser.new(cart, Order.new)
    expect(cart_checker.check_order).to eq(true)
  end

  scenario "it returns true when the cart is empty" do
    cart = Cart.new({})
    cart_checker = OrderParser.new(cart, Order.new)
    expect(cart_checker.check_order).to eq(false)
  end
end
