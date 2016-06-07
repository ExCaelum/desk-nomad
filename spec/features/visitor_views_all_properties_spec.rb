require 'rails_helper'

RSpec.feature "Visitor views all properties" do
  scenario "All properties are listed" do
    skip
    create_property
    create_second_property

    visit properties_path

    expect(page).to have_content("Property1")
    expect(page).to have_content("Another property")
  end
end
