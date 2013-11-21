CONN = ActiveRecord::Base.connection

inserts1 = []
password = BCrypt::Password.create("movieshare");
(1..99900).each do |i|
  (i+1..(i+1)+100).each do|j|
    inserts1.push "(null, #{i}, #{j})"
  end
end

inserts2 = []
password = BCrypt::Password.create("movieshare");
(99901..100001).each do |i|
  (1..100).each do|j|
    inserts2.push "(null, #{i}, #{j})"
  end
end


sql1 = "INSERT INTO followers VALUES #{inserts1.join(", ")}"
sql2 = "INSERT INTO followers VALUES #{inserts2.join(", ")}"

CONN.execute sql1
CONN.execute sql2
