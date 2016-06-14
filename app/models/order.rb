class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orders_properties
  has_many :properties, through: :orders_properties

  validates :user_id, presence: true
  
  def total
    orders_properties.map do |order_prop|
      order_prop.property.price * order_prop.quantity.to_i
    end.reduce(:+)
  end
end
