class Category < ApplicationRecord
  has_many :expenses
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 30 }

  def select_option_presenter
    name
  end
end
