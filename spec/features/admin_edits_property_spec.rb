require "rails_helper"

RSpec.feature "Admin Can Edit Property" do
  scenario "logged in admin updates existing property" do
    admin = create_admin
    property = create_one_property

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit dashboard_path

    expect(page).to have_content("Admin Dashboard")

    visit admin_properties_path

    expect(property.title).to eq "Property1"

    click_on "Edit"
    expect(current_path).to eq(edit_admin_property_path(property))

    fill_in "Title", with: "New Title"
    fill_in "Description", with: "This is an updated property"
    select "retired", :from => "Status"
    click_on "Update Property"

    expect(current_path).to eq(admin_properties_path)
    expect(page).to have_content("New Title")
    expect(page).to have_content("retired")

    # expect(property.title).to eq("New Title")
    # # expect(property.description).to eq("This is an updated property")
    # expect(property.title).to eq ("New Title")
    # expect(property.status).to eq("retired")
  end

  scenario "non-admin user cannot edit property" do
    user = create_user
    property = create_one_property

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit properties_path
    expect(page).to_not have_content("Edit")

    visit edit_admin_property_path(property)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end

# Background: an existing item
# As an admin
# When I visit "admin/items"
# And I click "Edit"
# Then my current path should be "/admin/items/:ITEM_ID/edit"
# And I should be able to upate title, description, image, and status
