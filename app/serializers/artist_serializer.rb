class ArtistSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :password_digest, :styles, :pricing, :contact_info
end
