class NightSerializer < ActiveModel::Serializer

  embed :ids, include: false

  attributes :id, :subject
  has_many :songs, key: :songs
  has_many :scriptures, key: :scriptures
  has_many :activities, key: :activities

end
