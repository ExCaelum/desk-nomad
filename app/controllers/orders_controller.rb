class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def create
    @order = current_user.orders.new
    if @order.save
      @order.confirm_order(@cart)
      session.delete :cart
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      byebug
      "lol"
      redirect_to login_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

end
