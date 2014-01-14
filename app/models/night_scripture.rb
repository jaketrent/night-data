class NightScripture < ActiveRecord::Base
  belongs_to :night
  belongs_to :scripture
end
