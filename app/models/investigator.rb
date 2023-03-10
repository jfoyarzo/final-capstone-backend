class Investigator < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :photo, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :fee, presence: true, numericality: { greater_than: 0 }
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
