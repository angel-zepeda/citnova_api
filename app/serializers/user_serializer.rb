class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :role, :avatar
  has_many :complains
end
