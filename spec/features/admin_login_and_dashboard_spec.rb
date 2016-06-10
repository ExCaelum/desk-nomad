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
end
