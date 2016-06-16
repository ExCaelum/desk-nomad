require "rails_helper"

RSpec.feature "property can be retired" do
  scenario "user visits page for retired item" do
    create_user
    property1, property2 = create_property(2)
    property1.retire_property

    visit property_path(property1)

    expect(current_path).to eq(property_path(property1))

    within("#active-retired") do
      expect(page).to_not have_content("Book It!")
    end

    within("#active-retired") do
      expect(page).to have_content("Property Unavailable")
    end
  end

  scenario "retired property does not appear on property index page" do
    property1, property2 = create_property(2)
    property1.retire_property

    visit properties_path

    expect(page).to_not have_content(property1.title)
  end

  scenario "retired property does not appear on category page" do
    category = create_category
    property1, property2 = create_property(2)
    category.properties << property1
    category.properties << property2

    property1.retire_property

    visit category_path(category)

    expect(page).to_not have_content(property1.title)
  end
end
