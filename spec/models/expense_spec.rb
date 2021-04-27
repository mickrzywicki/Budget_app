require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject {
    described_class.new(name: "Cokolwiek",
                        price: 9.99,
                        paid_on: Date.today)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name and name are too long' do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.errors.messages[:name]).to eq ["can't be blank", "is too short (minimum is 2 characters)"]
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
    expect(subject.errors.messages[:price]).to eq ["can't be blank","is not a number"]
  end

  it 'is not valid without a paid_on date' do
    subject.paid_on = Date.tomorrow
    # expect(subject).to raise_error(I18n.t('mail_error_valid'))
    expect(subject).to_not be_valid
    expect(subject.errors.messages[:paid_on]).to eq [I18n.t('mail_error_valid')]
  end
end
