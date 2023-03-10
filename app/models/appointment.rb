class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :investigator

  validates :user_id, presence: true
  validates :investigator_id, presence: true
  validates :date, presence: true
  validates :city, presence: true, length: { minimum: 3, maximum: 50 }
end
