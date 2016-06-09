class PropertyExtractor < SimpleDelegator
  attr_reader :space, :quantity, :total

  def initialize(space, total, quantity)
    super(space)
    @total = total
    @quantity = quantity
  end
  
end
