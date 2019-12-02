class User < ApplicationRecord
  has_many :passengers
  validates :first_name, presence: true
  validates :last_name, presence: true
  #deactivate user instead of deleting
  def destroy
    update_attributes(deactivated: true) unless deactivated
  end

  #forbid the user from login when they are diactivated
  def active_for_authentication?
        super && !deactivated
    end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
