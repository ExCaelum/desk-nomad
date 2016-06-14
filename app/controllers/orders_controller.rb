class OrdersController < ApplicationController

  def index
    if current_user
      @orders = current_user.orders
    else
      flash.now[:error] = "Permission Denied"
      redirect_to "/"
    end
  end

  def create
    @order = current_user.orders.new
    order_parser = OrderParser.new(@cart, @order)
    if order_parser.check_order
      order_parser.confirm
      session.delete :cart
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:success] = "Please add items to your cart before checking out"
      redirect_to "/cart"
    end
  end

  def show
    @order = Order.find(params[:id])
    if current_user.id == @order.user_id
      true
    else
      render file: "/public/404"
    end
  end

end
