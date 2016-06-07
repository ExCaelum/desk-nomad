class Property < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true,
                    uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: true
  validates :image_file_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
