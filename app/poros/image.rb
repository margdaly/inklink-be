class Image
  attr_reader :id, :thumbnail, :title

  def initialize(data)
    @id = nil
    @thumbnail = data[:thumbnailUrl]
    @title = data[:name]
  end
end
