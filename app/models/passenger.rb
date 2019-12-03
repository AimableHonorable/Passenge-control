class Passenger < ApplicationRecord
  paginates_per 7
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :phone, presence: true, length: {:minimum => 10, :maximum => 10 }
  validates :id_number, presence: true, length: {:minimum => 16, :maximum => 16 }
  validates :ref_first_name, presence: true
  validates :destination, presence: true
  validates :ref_last_name, presence: true
  validates :ref_phone_number, presence: true, length: {:minimum => 10, :maximum => 10 }
  validates :entry_on, presence: true
  validates :return_on, presence: true
  validate :entry_on_should_not_be_past
  validate :return_is_greater_than_entry_date

  def entry_on_should_not_be_past
    if entry_on.present? && entry_on < Date.today
      errors.add(:entry_on, "Invalid entry date. Pick a date that is not past")
    end
  end

  def return_is_greater_than_entry_date
    if entry_on.present? && return_on.present? && return_on < entry_on
      errors.add(:return_on, "Return date should be in future")
    end
  end
end
