CONN = ActiveRecord::Base.connection
inserts = []
(1..100).each do |i|
  #user_watched = WatchedMovie.find_by_user_id(i)
  #user_watched.movies = "tt0462538;tt0234215;tt0111161;tt0068646;tt0110912;tt0060196;tt0468569;tt0050083;tt0108052;tt0167260;tt0137523;tt0080684"
  #user_watched.save
  inserts.push "('tt0462538;tt0234215;tt0111161;tt0068646;tt0110912;tt0060196;tt0468569;tt0050083;tt0108052;tt0167260;tt0137523;tt0080684')"
end
sql = "UPDATE watched_movies SET movies = #{inserts.join(", ")}"

CONN.execute sql
