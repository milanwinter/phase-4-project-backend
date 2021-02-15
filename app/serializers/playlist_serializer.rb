class PlaylistSerializer < ActiveModel::Serializer
    attributes :title, :id
    belongs_to :user, serializer: UserSerializer
    has_many :videos
end