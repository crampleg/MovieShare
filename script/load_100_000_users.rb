CONN = ActiveRecord::Base.connection

inserts1 = []
inserts2 = []
password = BCrypt::Password.create("movieshare");
(1..10000).each do |i|
  #user = User.create(username: "johnny#{i}", firstname: "John#{i}", lastname: "Doe#{i}", email: "john.doe#{i}@gmail.com", password_digest: BCrypt::Password.create("movieshare"), description: "MyDescription#{i}") 
  #WatchedMovie.create(user_id: user.id, movies: "")
  inserts1.push "(null, 'johnny#{i}', 'John', 'Doe#{i}', 'john.doe#{i}@gmail.com', '#{password}', '2013-11-14 22:48:22', '2013-11-14 22:48:22', 'Description about Johnny#{i}')"
  inserts2.push "(null, #{i}, '', '2013-11-14 22:48:22', '2013-11-14 22:48:22')"
end
sql1 = "INSERT INTO users VALUES #{inserts1.join(", ")}"
sql2 = "INSERT INTO watched_movies VALUES #{inserts2.join(", ")}"

CONN.execute sql1
CONN.execute sql2