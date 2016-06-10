require "rails_helper"

RSpec.feature "visitor can see properties for a category" do
  scenario "visitor visits category page" do
    category = create_category
    property1, property2 = create_property(2)

    category.properties << property1
    category.properties << property2

    visit category_path(category)

    within ("h1") do
      expect(page).to have_content("Work Space")
    end

    within (".col-md-3:first") do
      expect(page).to have_content("Property0")
    end

    within (".col-md-3:last") do
      expect(page).to have_content("Property1")
    end
  end
end
