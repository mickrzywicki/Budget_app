class Expense < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, length: { minimum: 1 }

end
