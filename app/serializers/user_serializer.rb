class UserSerializer < ActiveModel::Serializer
  attributes :username, :id
  has_many :playlists
  has_many :videos, through: :playlists
end
