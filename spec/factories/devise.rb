FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'test@user.com' }
    password { 'qwerty' }
    name { 'test user' }
    # Add additional fields as required via your User model
  end
end
