class Statement < ApplicationRecord
  has_many :incomes, dependent: :destroy
  has_many :expenditures, dependent: :destroy

  validates :user, presence: true
  validates :incomes, presence: true
  validates :expenditures, presence: true

  def total_income
    incomes.sum(&:amount)
  end

  def total_expenditure
    expenditures.sum(&:amount)
  end
end
