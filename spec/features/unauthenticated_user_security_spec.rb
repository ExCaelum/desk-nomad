require 'rails_helper'

RSpec.feature "Unauthorized user doesn't have acess to other's data" do
  scenario "visitor cannot view user dashboard page" do
    visit root_path

    visit ("/dashboard")


    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  
end
