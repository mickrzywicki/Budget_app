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

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a paid_on date' do
    subject.paid_on = Date.tomorrow
    expect(subject).to_not be_valid
  end
end
