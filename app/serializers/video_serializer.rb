class VideoSerializer < ActiveModel::Serializer
    attributes :videoId, :playlist_id
    belongs_to :playlist, serializer: PlaylistSerializer
  end