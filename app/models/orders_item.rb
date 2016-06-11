class OrdersItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :order

  validates :quantity, presence: true
end
