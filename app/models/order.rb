class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orders_properties
  has_many :properties, through: :orders_properties

  validates :user_id, presence: true

  def confirm_order(cart)
    cart.contents.each_pair do |id, qty|
      orders_properties.create(property_id: id, quantity: qty)
      update(status: "ordered")
    end
  end

  def total
    orders_properties.map do |order_prop|
      order_prop.property.price * order_prop.quantity.to_i
    end.reduce(:+)
  end
end
