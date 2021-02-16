class PlaylistSerializer < ActiveModel::Serializer
    attributes :title, :id, :likes
    belongs_to :user, serializer: UserSerializer
    has_many :videos
    has_many :likes
end