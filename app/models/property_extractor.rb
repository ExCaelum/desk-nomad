class PropertyExtractor < SimpleDelegator
  attr_reader :space, :quantity, :total

  def initialize(property_id, quantity)
    @space = super(Property.find(property_id))
    @quantity = quantity
  end

  def total
    @quantity * @space.price
  end
end
