staff_user = User.create!(email: 'test@example.com', password: 'password',
                          password_confirmation: 'password', first_name: 'Test',
                          last_name: 'User', role: 'staff')

User.create!(email: 'admin@example.com', password: 'password',
             password_confirmation: 'password', first_name: 'Admin',
             last_name: 'User', role: 'admin')

billy_idol_artist = Artist.create!(name: 'Billy Idol')
billy_idol_album = Album.create!(name: 'Billy Idol', label: 'Chrysalis')
white_wedding = Track.create!(name: 'White Wedding', artist_id: billy_idol_artist.id)

Play.create!([
  {user_id: staff_user.id, album_id: billy_idol_album.id,
   track_id: white_wedding.id, played_at: 1.days.ago}
])

beach_boys = Artist.create!(name: 'Beach Boys')
good_vibrations_album = Album.create!(name: 'Good Vibrations', label: 'Capitol')
good_vibrations = Track.create!(name: 'Good Vibrations', artist_id: beach_boys.id)

Play.create!([
  {user_id: staff_user.id, album_id: good_vibrations_album.id,
   track_id: good_vibrations.id, played_at: 1.weeks.ago}
])

still_cruisin = Album.create!(name: "Still Cruisin'", label: 'Capitol')
kokomo = Track.create!(name: 'Kokomo', artist_id: beach_boys.id)

Play.create!([
  {user_id: staff_user.id, album_id: still_cruisin.id,
   track_id: kokomo.id, played_at: 3.weeks.ago}
])

somewhere_near_japan = Track.create!(name: 'Somewhere Near Japan', artist_id: beach_boys.id)

Play.create!([
  {user_id: staff_user.id, album_id: still_cruisin.id,
   track_id: somewhere_near_japan.id, played_at: 3.days.ago}
])

