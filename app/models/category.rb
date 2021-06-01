class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 30 }
end
