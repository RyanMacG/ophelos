class Expenditure < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
