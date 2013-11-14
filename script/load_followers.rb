(1..100).each do |i|
  (i+1..(i+1)+100).each do|j|
    Follower.create(user_id_model: i, user_id_follower: j)
  end
end