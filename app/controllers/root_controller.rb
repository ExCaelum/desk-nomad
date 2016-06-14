class RootController < ApplicationController
  def show
    @property_cities = Property.pluck(:city)
  end
end
