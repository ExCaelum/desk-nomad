class OrderParser

  def initialize(cart, order)
    @cart = cart
    @order = order
  end

  def check_order
    if @cart.contents.empty?
      false
    else
      true
    end
  end

  def confirm
    @order.save
    confirm_order
  end

  def confirm_order
    @cart.contents.each_pair do |id, qty|
      @order.orders_properties.create(property_id: id, quantity: qty)
      @order.update(status: "ordered")
    end
  end

end
