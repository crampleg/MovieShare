CONN = ActiveRecord::Base.connection

inserts = []
password = BCrypt::Password.create("movieshare");
(1..10).each do |i|
  #user = User.create(username: "johnny#{i}", firstname: "John#{i}", lastname: "Doe#{i}", email: "john.doe#{i}@gmail.com", password_digest: BCrypt::Password.create("movieshare"), description: "MyDescription#{i}") 
  #WatchedMovie.create(user_id: user.id, movies: "")
  inserts.push "(null, 'johnny#{i}', 'John', 'Doe#{i}', 'john.doe#{i}@gmail.com', '#{password}', '2013-11-14 22:48:22', '2013-11-14 22:48:22', 'Description about Johnny#{i}')"
end
sql = "INSERT INTO users VALUES #{inserts.join(", ")}"

CONN.execute sql