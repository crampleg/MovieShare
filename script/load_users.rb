(1..10000).each do |i|
  user = User.create(username: "johnny#{i}", firstname: "John#{i}", lastname: "Doe#{i}", email: "john.doe#{i}@gmail.com", password_digest: BCrypt::Password.create("movieshare"), description: "MyDescription#{i}") 
  WatchedMovie.create(user_id: user.id, movies: "")
end