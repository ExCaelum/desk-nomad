require 'rails_helper'

RSpec.feature "Visitor sees home page" do
  scenario "visits root path sees home page" do

    visit root_path

    within('#home-page') do
      expect(page).to have_content("DeskNomad")
    end

  end
end
