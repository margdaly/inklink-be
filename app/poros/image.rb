class Image
  attr_reader :thumbnail, :title

  def initialize(data)
    @thumbnail = data[:thumbnail]
    @title = data[:title]
  end
end
