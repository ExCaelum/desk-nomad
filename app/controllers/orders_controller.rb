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
    cart_checker = CartChecker.new(@cart)
    if cart_checker.check_cart
      @order.save
      @order.confirm_order(@cart)
      session.delete :cart
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:success] = "Please add items to your cart before checking out"
      redirect_to "/cart"
    end
  end

  def show
    if current_user
      @order = Order.find(params[:id])
    else
      flash.now[:error] = "#{@order.errors.full_messages.join(", ")}"
    end
  end

end
