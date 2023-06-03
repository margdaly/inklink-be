class Image
  attr_reader :id, :thumbnail, :title

  def initialize(data)
    @id = nil
    @thumbnail = data[:thumbnail]
    @title = data[:title]
  end
end
