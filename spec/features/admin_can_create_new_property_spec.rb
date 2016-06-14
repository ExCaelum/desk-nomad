require 'rails_helper'

RSpec.feature "admin can add property" do
  scenario "with valid property attributes" do
    admin = create_admin
    category = create_category

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit dashboard_path

    click_on "Add New Space"

    fill_in "Title", with: "Property"
    fill_in "Description", with: "This is a nice property"
    fill_in "Price", with: 100
    select "Denver", :from => "City"
    select "Colorado", :from => "State"

    select "Work Space", :from => "Space Category"

    click_on "Create Space"

    expect(current_path).to eq(properties_path)
    expect(page).to have_content("Property Created Sucessfully")

    within (".col-md-3") do
      expect(page).to have_content("Property")
      expect(page).to have_content("Denver")
      expect(page).to have_content($100)
    end
  end

  scenario "with invalid property attributes" do
    admin = create_admin
    category = create_category

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit dashboard_path

    click_on "Add New Space"

    fill_in "Title", with: ""
    fill_in "Description", with: "This is a nice property"
    fill_in "Price", with: 100
    select "Denver", :from => "City"
    select "Colorado", :from => "State"

    select "Work Space", :from => "Space Category"

    click_on "Create Space"

    expect(page).to have_content("Property was unable to be created")
  end
end
