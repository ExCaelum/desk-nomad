class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def has_contents
    if @contents.empty?
      false
    else
      true
    end
  end

  def add_property(property_id)
    contents[property_id.to_s] ||= 0
    contents[property_id.to_s] += 1
  end

  def return_properties
    @contents.map do |property_id, quantity|
      space = Property.find(property_id)
      price = space.price
      PropertyExtractor.new(space, quantity)
    end
  end

  def cart_total
    return_properties.map do |property|
      property.total
    end.reduce(:+)
  end

  def total_properties
    contents.values.sum
  end

  def remove_property(prop_id)
    contents.reject!{ |id| id == prop_id.to_s}
  end

end
