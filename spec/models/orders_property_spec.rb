require "rails_helper"

RSpec.describe OrdersProperty, type: :model do

  it { should belong_to(:property) }
  it { should belong_to(:order) }

end
