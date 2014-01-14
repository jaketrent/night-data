class NightActivity < ActiveRecord::Base
  belongs_to :night
  belongs_to :activity
end
