class Activity < ActiveRecord::Base
  has_many :night_activities, dependent: :destroy
  has_many :nights, through: :night_activity
end
