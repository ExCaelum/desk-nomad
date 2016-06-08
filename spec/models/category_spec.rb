require 'rails_helper'

RSpec.describe Category, type: :model do

  it {should validate_presence_of(:title)}
  it {should have_many(:properties)}

  scenario "uniqueness of title" do
    cat1 = Category.create(:title => 'Work Space')
    cat2 = Category.create(:title => cat1.title)

    expect(cat1.valid?).to be_truthy
    expect(cat2.valid?).to be_falsy
  end

  scenario "test to_param override" do
    cat = create_category

    expect(cat.to_param).to eq("work-space")
  end

  scenario "test we are creating a slug" do
    cat = create_category

    expect(cat.slug).to eq("work-space")
  end



end
