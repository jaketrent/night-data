class Song < ActiveRecord::Base
  has_many :night_song, dependent: :destroy
  has_many :nights, through: :night_song
end
