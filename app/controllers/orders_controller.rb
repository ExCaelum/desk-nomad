class OrdersController < ApplicationController
  before_action :current_user_matches_order, only: [:show]

  def index
    if current_user
      @orders = current_user.orders
    else
      flash.now[:error] = "Permission Denied"
      redirect_to root_path
    end
  end

  def create
    order = current_user.orders.new
    order_parser = OrderParser.new(@cart, order)
    if order_parser.check_order
      UserNotifier.send_booking_email(current_user, @cart).deliver
      order_parser.confirm
      session.delete :cart
      redirect_to new_charge_path(order: order)
    else
      flash[:success] = "Please add items to your cart before checking out"
      redirect_to "/cart"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

 private

  def current_user_matches_order
    order = Order.find(params[:id])
    if current_user.id == order.user_id
      true
    else
      render file: "/public/404"
    end
  end

end
