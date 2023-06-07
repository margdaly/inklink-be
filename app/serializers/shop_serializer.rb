class ShopSerializer
  include JSONAPI::Serializer
  attributes :name, :address
end
