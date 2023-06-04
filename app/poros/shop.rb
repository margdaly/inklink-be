class Shop
  attr_reader :id, :name, :address
  def initialize(data)
    @id = nil
    @name = data[:name]
    @address = data[:location][:formatted_address]
  end
end