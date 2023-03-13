require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject do
    @user = User.create!(id: 1, name: 'John Doe', email: 'john@doe.com', password: 'Password1#')
    @investigator = Investigator.create!(id: 1, name: 'Investi Dog', photo: 'https://beautifulphoto.com/photo.jpg', description: 'Dog, P.I. is a dog who solves mysteries.', fee: 99.50, rating: 5)
    @appointment = Appointment.create!(date: '2023-05-01 12:00', city: 'Manhattan, NY', investigator_id: 1, user_id: 1)
  end

  before { subject.save }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a city' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a properly-named city' do
      subject.city = 'a'
      expect(subject).to_not be_valid
      subject.city = 'a' * 51
      expect(subject).to_not be_valid
    end

    it 'is not valid without an investigator_id' do
      subject.investigator_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
