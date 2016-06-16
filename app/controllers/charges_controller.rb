class ChargesController < ApplicationController
  before_action :order_amount, only: [:new, :create]

  def new
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => "Desk Nomad",
      :currency => "usd"
    )
    # order = Order.last
    # order.update_status_paid
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

    def order_amount
      @amount = Order.last.total * 100
    end

end
