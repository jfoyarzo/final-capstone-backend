class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments, dependent: :destroy
  has_many :investigators, through: :appointments

  before_validation :set_default_role
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validate :password_complexity

  private

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, 'Complexity requirement not met.
    Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  # set default role to user
  def set_default_role
    self.admin ||= false
  end
end
