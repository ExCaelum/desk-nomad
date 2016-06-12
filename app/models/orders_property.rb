class OrdersProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :order

  validates :quantity, presence: true

  def find_property
    Property.find(self.property_id)
  end

  def total
    find_property.price * self.quantity.to_i
  end
end
