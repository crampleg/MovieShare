(1..100).each do |i|
  UnseenMovie.create(owner_id: i, movie_name: "tt0462538")
  UnseenMovie.create(owner_id: i, movie_name: "tt0234215")
  UnseenMovie.create(owner_id: i, movie_name: "tt0111161")
  UnseenMovie.create(owner_id: i, movie_name: "tt0068646")
  UnseenMovie.create(owner_id: i, movie_name: "tt0110912")
end