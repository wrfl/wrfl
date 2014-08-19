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
   track_id: white_wedding.id}
])
