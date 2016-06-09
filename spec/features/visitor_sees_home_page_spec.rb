require 'rails_helper'

RSpec.feature "Visitor sees home page" do
  scenario "visits root path sees home page" do

    visit root_path

    within(".brand-before") do
      expect(page).to have_content("Welcome to")
    end

  end
end
