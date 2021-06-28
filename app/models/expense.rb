class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, :price, :paid_on, :user, presence: true
  validates :name, length: { minimum: 2, maximum: 100 }
  validates :price, format: { with: /\A\d+(\.\d{1,2})?\Z/, allow_blank: true },
                    numericality: { greater_than: 0 }
  validate :paid_on_cannot_be_in_the_future

  private


  def paid_on_cannot_be_in_the_future
    return if paid_on.nil?

    errors.add(:paid_on, :not_in_future) if paid_on > Date.today
  end
end
