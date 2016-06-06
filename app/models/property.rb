class Property < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true,
                    uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: true
  validates :image_file_name, presence: true
  validates :image_content_type, presence: true
  validates :image_file_size, presence: true
  validates :image_updated_at, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
