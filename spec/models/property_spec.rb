require 'rails_helper'

RSpec.describe Property, type: :model do

  it {should validate_presence_of(:title) }
  it {should validate_uniqueness_of(:title) }
  it {should validate_presence_of(:description) }
  it {should validate_presence_of(:price) }
  it {should validate_numericality_of(:price) }
  it {should validate_presence_of(:image_file_name) }
  it {should validate_presence_of(:city) }
  it {should validate_presence_of(:state) }
  it {should belong_to(:category) }

end
