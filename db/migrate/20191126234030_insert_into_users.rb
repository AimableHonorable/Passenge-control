class InsertIntoUsers < ActiveRecord::Migration[5.2]
  def self.up
    User.create(:first_name => "Paul", :last_name => "John", :email => 'paul@gmail.com', :password => 'password', :admin => true)
  end
  # def self.down
  #   User.delete_all(:username => "Hello")
  # end
end
