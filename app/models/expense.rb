class Expense < ApplicationRecord
  validates :name, :price, :date, presence: true
  validates :name, length: { minimum: 2, maximum: 100 }
  validates :price, format: { with: /\A\d+(\.\d{2})?\Z/, allow_blank: true },
                   numericality: { greater_than: 0 }
  validate :date_cannot_be_in_the_future


  private

  
  def date_cannot_be_in_the_future
    if date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end
end
