require 'rails_helper'

RSpec.feature "Visitor views all properties" do
  scenario "All properties are listed" do
    num = create_property(2)

    visit properties_path

    within('h1') do
      expect(page).to have_content("All Properties")
    end

    within('.col-md-3:first') do
      expect(page).to have_content("Property0")
    end

    within('.col-md-3:last') do
     expect(page).to have_content("Property1")
   end
  end
end
