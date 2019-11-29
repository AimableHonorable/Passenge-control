class InsertIntoUsers < ActiveRecord::Migration[5.2]
  def self.up
    User.create(:first_name => "Twiringiyimana", :last_name => "Aimable", :email => 'aima@gmail.com', :password => 'password', :admin => true, :deactivated => false)
  end
end
