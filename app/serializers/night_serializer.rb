class NightSerializer < ActiveModel::Serializer

  embed :ids, include: false

  attributes :id, :subject
  has_many :songs, key: :songs

end
