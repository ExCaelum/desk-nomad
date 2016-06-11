require 'rails_helper'

RSpec.describe OrdersItem, type: :model do
  it {should validate_presence_of(:quantity)}
  it {should belong_to(:user)}
  it {should belong_to(:order)}
end
