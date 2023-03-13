require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.create!(name: 'John Doe', email: 'john@doe.com', password: 'Password1#', id: 1)
  end

  before { subject.save }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a proper-length name' do
      subject.name = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a proper password' do
      subject.password = 'password'
      expect(subject).to_not be_valid
    end
  end
end