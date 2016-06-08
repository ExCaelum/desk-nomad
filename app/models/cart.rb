class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_property(property_id)
    contents[property_id.to_s] ||= 0
    contents[property_id.to_s] += 1
  end

  def total_properties
    contents.values.sum
  end

end
