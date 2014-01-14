# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# SONGS
song1 = { number: 123, title: 'Once There Was a Snowman'}
song2 = { number: 234, title: 'In the Sun He Melted' }
songs = Song.create([song1, song2])

# SCRIPTURES
script1 = { reference: '1 Corinthians 10:3'}
script2 = { reference: 'D&C 25:1'}
scriptures = Scripture.create([script1, script2])

# ACTIVITIES
act1 = { description: 'Run around in circles so fast until you fall down.  The last one standing wins.' }
act2 = { description: 'Play Sturdy Birdy game' }
activities = Activity.create([act1, act2])

# NIGHTS
night1 = {
  subject: 'Loving our Neighbor',
  song_ids: [songs[0].id],
  scripture_ids: [scriptures[0].id, scriptures[1].id],
  activity_ids: [activities[0].id]
}
night2 = {
  subject: 'Old Testament',
  song_ids: [songs[0].id, songs[1].id],
  scripture_ids: [scriptures[0].id],
  activity_ids: [activities[1].id]
}
nights = Night.create([night1, night2])
