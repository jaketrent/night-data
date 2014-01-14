class Scripture < ActiveRecord::Base
  has_many :night_scripture, dependent: :destroy
  has_many :nights, through: :night_scripture
end
