class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 4, maximum: 30 }
end
