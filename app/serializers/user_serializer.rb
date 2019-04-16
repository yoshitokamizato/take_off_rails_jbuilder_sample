class UserSerializer < ActiveModel::Serializer
  attributes :id, :account, :name, :email
end
