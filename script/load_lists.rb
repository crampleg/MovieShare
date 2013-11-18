(1..100).each do |i|
  list1 = MyList.create(list_name: "My Favorites", owner_id: "#{i}")
  list2 = MyList.create(list_name: "Scary Movies", owner_id: "#{i}")
  list3 = MyList.create(list_name: "Best Comedies", owner_id: "#{i}")
  ListMovie.create(list_id: list1.id, movie_name: "tt0462538")
  ListMovie.create(list_id: list1.id, movie_name: "tt0234215")
  ListMovie.create(list_id: list1.id, movie_name: "tt0111161")
  ListMovie.create(list_id: list1.id, movie_name: "tt0068646")
  ListMovie.create(list_id: list1.id, movie_name: "tt0110912")
  
  ListMovie.create(list_id: list2.id, movie_name: "tt0462538")
  ListMovie.create(list_id: list2.id, movie_name: "tt0234215")
  ListMovie.create(list_id: list2.id, movie_name: "tt0111161")
  ListMovie.create(list_id: list2.id, movie_name: "tt0068646")
  ListMovie.create(list_id: list2.id, movie_name: "tt0110912")
  
  ListMovie.create(list_id: list3.id, movie_name: "tt0462538")
  ListMovie.create(list_id: list3.id, movie_name: "tt0234215")
  ListMovie.create(list_id: list3.id, movie_name: "tt0111161")
  ListMovie.create(list_id: list3.id, movie_name: "tt0068646")
  ListMovie.create(list_id: list3.id, movie_name: "tt0110912")
end