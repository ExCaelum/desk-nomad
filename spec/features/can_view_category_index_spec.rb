require "rails_helper"

RSpec.feature "user can go to the category index" do
  scenario "category show page shows all categories" do
    category = create_category
    visit categories_path
save_and_open_page
    expect(page).to have_content?(category.title)
  end
end
