require 'rails_helper'

RSpec.describe CartChecker, type: :model do

  scenario "it returns false when the cart has contents" do
    cart = Cart.new({"1"=>1})
    cart_checker = CartChecker.new(cart)
    expect(cart_checker.check_cart).to eq(true)
  end

  scenario "it returns true when the cart is empty" do
    cart = Cart.new({})
    cart_checker = CartChecker.new(cart)
    expect(cart_checker.check_cart).to eq(false)
  end
end
