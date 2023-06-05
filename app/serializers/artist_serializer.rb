class ArtistSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :password_digest, :styles, :pricing
end
