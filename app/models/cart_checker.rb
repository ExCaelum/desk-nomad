class CartChecker

  def initialize(cart)
    @cart = cart
  end

  def check_cart
    if @cart.contents.empty?
      false
    else
      true
    end
  end
end
