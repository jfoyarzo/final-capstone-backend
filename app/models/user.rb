class User < ApplicationRecord
  has_many :appointments
  has_many :investigators, through: :appointments
end
