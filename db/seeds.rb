# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# SONGS
song1 = { number: 123, title: 'Once There Was a Snowman'}
song2 = { number: 234, title: 'In the Sun He Melted' }
songs = Song.create([song1, song2])

# NIGHTS
night1 = { subject: 'Loving our Neighbor' }
night2 = { subject: 'Old Testament' }
nights = Night.create([night1, night2])
