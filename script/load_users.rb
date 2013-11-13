(1..10000).each do |i|
  User.create(username: "Customer #{i}", firstname: "John#{i}", lastname: "Doe#{i}", email: "john.doe#{i}@gmail.com", password_digest: "Password#{i}", description: "MyDescription#{i}") 
end