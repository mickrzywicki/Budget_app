require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    described_class.new(name: 'Something')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name and name are too long' do
    subject.name = nil
    expect(subject).to be_invalid
    expect(subject.errors.messages[:name]).to eq ["can't be blank", 'is too short (minimum is 2 characters)']
  end
end
