require 'rails_helper'

RSpec.feature 'visitor can see properties for a category' do
  scenario 'visitor visits category page' do
    category = Category.create(title: "Work Space")
    category.properties.create(title: "Property1",
                                description: "This is a property",
                                price: 10,
                                image_file_name: "file_name.jpeg",
                                city: "Denver",
                                state: "Colorado")
    category.properties.create(title: "Another Property",
                               description: "This is a the second property",
                               price: 20,
                               image_file_name: "image_name.jpeg",
                               city: "Los Angeles",
                               state: "California" )
    visit category_path(category)
    expect(page).to have_content("Work Space")
    expect(page).to have_content("Property1")
    expect(page).to have_content("Another Property")
  end
end
