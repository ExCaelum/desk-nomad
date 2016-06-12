class PropertyExtractor < SimpleDelegator
  attr_reader :space, :quantity, :total

  def initialize(space, quantity)
    @space = super(space)
    @quantity = quantity
  end

  def total
    @quantity * @space.price
  end
end
