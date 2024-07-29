class Income < ApplicationRecord
  belongs_to :statement

  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
