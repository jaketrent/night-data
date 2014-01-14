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

# NIGHTS
night1 = { subject: 'Loving our Neighbor' }
night2 = { subject: 'Old Testament' }
nights = Night.create([night1, night2])
