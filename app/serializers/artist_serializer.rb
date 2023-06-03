class ArtistSerializer
  include JSONAPI::Serializer
  attributes :name, :username, :password_digest, :styles, :pricing, :contact_info
end
