class NightSong < ActiveRecord::Base
  belongs_to :night
  belongs_to :song
end
