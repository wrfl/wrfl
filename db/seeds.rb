puts 'Seed users'
password = 'password'
staff_user = User.create!(email: 'test@example.com', password: password,
                          password_confirmation: password, first_name: 'Test',
                          last_name: 'User', role: 'staff',
                          dj_name: 'DJ Philly Cream')

User.create!(email: 'admin@example.com', password: password,
             password_confirmation: password, first_name: 'Admin',
             last_name: 'User', role: 'admin')

puts 'Seed White Wedding play'
billy_idol_artist = Artist.create!(name: 'Billy Idol')
billy_idol_album = Album.create!(name: 'Billy Idol', label: 'Chrysalis')
white_wedding = Track.create!(name: 'White Wedding', artist: billy_idol_artist)
Play.create!(user: staff_user, album: billy_idol_album,
             track: white_wedding, played_at: 1.days.ago)

puts 'Seed Good Vibrations play'
beach_boys = Artist.create!(name: 'Beach Boys')
good_vibrations_album = Album.create!(name: 'Good Vibrations', label: 'Capitol')
good_vibrations = Track.create!(name: 'Good Vibrations', artist: beach_boys)
Play.create!(user: staff_user, album: good_vibrations_album,
             track: good_vibrations, played_at: 1.weeks.ago)

puts "Seed Still Cruisin' play"
still_cruisin = Album.create!(name: "Still Cruisin'", label: 'Capitol')
kokomo = Track.create!(name: 'Kokomo', artist: beach_boys)
Play.create!(user: staff_user, album: still_cruisin, track: kokomo,
             played_at: 3.weeks.ago)

puts 'Seed Somewhere Near Japan play'
somewhere_near_japan = Track.create!(name: 'Somewhere Near Japan',
                                     artist: beach_boys)
Play.create!(user: staff_user, album: still_cruisin,
             track: somewhere_near_japan, played_at: 3.days.ago)

puts 'Seed random DJs'
10.times do
  dj_name = "DJ #{Faker::Hacker.adjective.capitalize} " +
            Faker::App.name.capitalize
  user = User.create!(email: Faker::Internet.email,
                      first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name, role: 'staff',
                      dj_name: dj_name, password: password,
                      password_confirmation: password)
  puts "\t- #{user.name}"
end

users = User.all
puts 'Seed random play data'
50.times do
  artist = Artist.create!(name: Faker::Name.title)
  album = Album.create!(name: Faker::Commerce.product_name,
                        label: Faker::Company.name)
  track = Track.create!(name: Faker::Company.catch_phrase, artist_id: artist.id)
  play = Play.create!(user: users.sample, album: album,
                      track: track, played_at: (rand * 100).to_i.days.ago)
  puts "\t- #{play}"
end
