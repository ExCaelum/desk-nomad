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
    if @order.save
      @order.confirm_order(@cart)
      session.delete :cart
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      redirect_to login_path
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
