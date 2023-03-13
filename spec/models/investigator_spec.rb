require 'rails_helper'

RSpec.describe Investigator, type: :model do
  subject do
    @investigator = Investigator.create!(name: 'Investi Dog', photo: 'https://beautifulphoto.com/photo.jpg', description: 'Dog, P.I. is a dog who solves mysteries.', fee: 99.50, rating: 5)
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
      subject.name = 'a' * 51
      expect(subject).to_not be_valid
    end

    it 'is not valid without a photo' do
      subject.photo = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a proper-length description' do
      subject.description = 'a'
      expect(subject).to_not be_valid
      subject.description = 'a' * 501
      expect(subject).to_not be_valid
    end

    it 'is not valid without a fee' do
      subject.fee = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a proper value for a fee' do
      subject.fee = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid without a rating' do
      subject.rating = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a proper value for a rating' do
      subject.rating = -1
      expect(subject).to_not be_valid
    end
  end
end