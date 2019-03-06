class UserSerializer < ActiveModel::Serializer
  ### CACHING ###
  cache key: 'user'

  ### ATTRIBUTES ###
  attributes :name, :email
end
