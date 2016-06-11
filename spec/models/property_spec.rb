require 'rails_helper'

RSpec.describe Property, type: :model do

  it {should validate_presence_of(:title) }
  it {should validate_uniqueness_of(:title) }
  it {should validate_presence_of(:description) }
  it {should validate_presence_of(:price) }
  it {should validate_numericality_of(:price) }
  it {should validate_presence_of(:city) }
  it {should validate_presence_of(:state) }
  it {should belong_to(:category) }
  it {should have_many(:orders_properties)}
  it {should have_many(:orders)}

  scenario "it returns active properties" do
    property1, property2  = create_property(2)
    property1.retire_property

    expect(Property.active.count).to eq(1)
    expect(Property.active.first.title).to eq("Property1")
  end

  scenario "it retires property" do
    property  = create_one_property
    property.retire_property

    expect(property.status).to eq("retired")
  end

  scenario "it identifies retired property" do
    property  = create_one_property
    property.retire_property

    expect(property.retired?).to eq(true)
  end

end
