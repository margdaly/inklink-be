class ImageFacade
  def get_images(discover)
    results = service.get_images(discover)
    results[:value].map do |image_data|
      Image.new(image_data)
    end
  end

  private

  def service
    @service ||= ImagesService.new
  end
end
