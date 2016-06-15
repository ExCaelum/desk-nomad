class Admin::OrdersController < Admin::BaseController

  def index
    @status = params[:status]
    @orders = Order.where(status: @status)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status])
    redirect_to admin_order_path(@order)
  end
end
