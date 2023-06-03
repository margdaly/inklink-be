class UserSerializer
  include JSONAPI::Serializer

  attributes :name, :city, :email, :password_digest
end
