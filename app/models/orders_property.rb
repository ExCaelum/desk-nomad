class OrdersProperty < ActiveRecord::Base
  belongs_to :property
  belongs_to :order

  validates :quantity, presence: true
end
