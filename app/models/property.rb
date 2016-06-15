class Property < ActiveRecord::Base
  has_attached_file :property_image,
                    styles: {thumb: '100x100>',
                             square: '200x200#',
                             medium: '300x300>'
                            },
                    default_url: "default_:style.jpg"
  belongs_to :category
  has_many :orders_properties
  has_many :orders, through: :orders_properties

  validates_attachment_content_type :property_image,
                                    :content_type => /\Aimage\/.*\Z/
                                    # %w(image/jpg, image/jpeg, image/png)


  validates :title, presence: true,
                    uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: true
  validates :city, presence: true
  validates :state, presence: true
  scope :active, -> { where(status: "active")}
  scope :search, -> (city) {where(city: city)}

  def retired?
    if status == "retired"
      true
    end
  end

  def retire_property
    update(status: "retired")
  end

  def category_name
    if category
      category.title
    end
  end
end
