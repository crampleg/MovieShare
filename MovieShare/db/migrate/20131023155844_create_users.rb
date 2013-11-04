class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :firstname
    	t.string :lastname
    	t.string :email
    	t.string :password_digest
        t.string :following_no
        t.string :followers_no
 
    	t.timestamps
    end
  end
end
