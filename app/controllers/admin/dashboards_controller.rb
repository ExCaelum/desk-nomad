class Admin::DashboardsController < Admin::BaseController

  def show
    @user = current_user
    @orders = Order.all

    @completed = Order.where(status: "completed")
    @paid = Order.where(status: "paid")
    @ordered = Order.where(status: "ordered")
    @cancelled = Order.where(status: "cancelled")
  end


end
