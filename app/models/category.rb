class Category < ActiveRecord::Base
  has_many :properties

  validates :title, presence: true,
                    uniqueness: true

  def to_params
    "#{title.parameterize}"
  end
end
