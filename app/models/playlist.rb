class Playlist < ApplicationRecord
  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :likes, dependent: :destroy
end
