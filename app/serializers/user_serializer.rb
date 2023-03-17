class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :admin, :name, :email, :created_at
end
