class Category < ActiveRecord::Base
  before_save :update_slug
  has_many :properties

  validates :title, presence: true,
                    uniqueness: true

  def update_slug
    self.slug = title.parameterize
  end

  def to_param
    slug
  end
end
