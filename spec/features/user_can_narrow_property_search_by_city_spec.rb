require 'rails_helper'

RSpec.feature "visitor can narrow search by cities" do
  scenario "vistor selects city and sees properites in that city" do
    property1 = create_property(1)
    property2 = create_one_property

    visit root_path

    select "Denver", :from => :city

    click_on "Search"

    within (".col-md-3") do
      expect(page).to have_content("Property0")
      expect(page).to have_content("Denver")
      expect(page).to have_content($10)
      expect(page).to have_css("img[src]")
    end

    within (".col-md-3") do
      expect(page).to_not have_content("Property1")
      expect(page).to_not have_content("Los Angeles")
    end

  end
end
