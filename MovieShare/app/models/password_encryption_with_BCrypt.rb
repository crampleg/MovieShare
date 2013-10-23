 class Password_encryption_with_BCrypt < ActiveRecord::Base
 salt = BCrypt::Engine.generate_salt
 encrypted_password = BCrypt::Engine.hash_secret(password, salt)
end