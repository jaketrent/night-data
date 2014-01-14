class Night < ActiveRecord::Base
  has_many :night_song, dependent: :destroy
  has_many :songs, through: :night_song
end
