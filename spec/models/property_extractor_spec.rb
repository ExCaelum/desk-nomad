require "rails_helper"

RSpec.describe PropertyExtractor, type: :model do
  scenario "it returns instance" do
    property1, property2 = create_property(2)
    Cart.new({property1.id => 1, property2.id => 2 })
    extracted_property = PropertyExtractor.new(property1, 1)

    expect(extracted_property).to be_instance_of(PropertyExtractor)
  end

  scenario "it returns property instance" do
    property1, property2 = create_property(2)
    Cart.new({ property1.id => 1, property2.id => 2 })
    extracted_property = PropertyExtractor.new(property1, 1)

    expect(extracted_property.space).to be_instance_of(Property)
    expect(extracted_property.space.title).to eq("Property0")
  end

  scenario "it returns quantity for a property in cart" do
    property1, _property2 = create_property(2)
    Cart.new({ property1.id => 1, property1.id => 2 })
    extracted_property = PropertyExtractor.new(property1, 3)

    expect(extracted_property.quantity).to eq(3)
  end

  scenario "it returns total price for a property in cart" do
    property1, _property2 = create_property(2)
    Cart.new({ property1.id => 1, property1.id => 2 })
    extracted_property = PropertyExtractor.new(property1, 3)

    expect(extracted_property.total).to eq(30)
  end
end
