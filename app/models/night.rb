class Night < ActiveRecord::Base
  has_many :night_song, dependent: :destroy
  has_many :songs, through: :night_song

  has_many :night_scripture, dependent: :destroy
  has_many :scriptures, through: :night_scripture
end
