class Property < ActiveRecord::Base
  has_attached_file :image, default_url: "desk1.png"
  belongs_to :category

  validates_attachment_content_type :image,
                                    :content_type =>
                                    %w(image/jpg, image/jpeg, image/png)


  validates :title, presence: true,
                    uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: true
  validates :city, presence: true
  validates :state, presence: true


end
