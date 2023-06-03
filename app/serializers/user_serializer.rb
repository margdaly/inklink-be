class UserSerializer
  include JSONAPI::Serializer

  attributes :name, :city, :username, :password_digest
end
