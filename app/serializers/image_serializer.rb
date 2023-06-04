class ImageSerializer
  include JSONAPI::Serializer
  attributes :thumbnail, :title
end
