require "rails_helper"

RSpec.describe PropertyExtractor, type: :model do
  scenario "it returns instance" do
    property1, property2 = create_property(2)
    cart = Cart.new({property1.id => 1, property2.id => 2})
    extracted_property = PropertyExtractor.new(property1, 1)

    expect(extracted_property).to be_instance_of(PropertyExtractor)
    expect(extracted_property.space).to be_instance_of(Property)

  end

  scenario "it returns instance" do
    property1, property2 = create_property(2)
    cart = Cart.new({property1.id => 1, property2.id => 2})
    extracted_property = PropertyExtractor.new(property1, 1)

    expect(extracted_property.space.title).to eq("Property0")
  end
end
