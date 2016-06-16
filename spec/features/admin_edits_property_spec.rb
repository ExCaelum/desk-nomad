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
    select "retired", from: "Status"

    click_on "Update Property"

    expect(current_path).to eq(admin_properties_path)
    expect(page).to have_content("New Title")
    expect(page).to have_content("retired")

    property = Property.find(property.id)

    expect(property.title).to eq("New Title")
    expect(property.description).to eq("This is an updated property")
    expect(property.status).to eq("retired")
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
