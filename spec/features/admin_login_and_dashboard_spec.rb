require 'rails_helper'

RSpec.feature "registered admin can create account" do
  scenario "after login, admin is directed to their dashboard" do
    admin = create_admin

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content("Admin Dashboard")

    within(".row.text-center") do
      expect(page).to have_content("Welcome, #{admin.first_name}")
    end
  end

  scenario "Non-admin user cannot view admin dashboard" do
    user = create_user

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to_not have_content("Admin Dashboard")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "visitor cannot access admin dashboard and sees 404" do
    visit admin_dashboard_path

    expect(page).to_not have_content("Admin Dashboard")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
  
end
