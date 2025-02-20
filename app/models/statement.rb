class Statement < ApplicationRecord
  has_many :incomes, dependent: :destroy
  has_many :expenditures, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
  validates :incomes, presence: true
  validates :expenditures, presence: true

  accepts_nested_attributes_for :incomes
  accepts_nested_attributes_for :expenditures

  def total_income
    incomes.sum(&:amount)
  end

  def total_expenditure
    expenditures.sum(&:amount)
  end

  def disposable_income
    total_income - total_expenditure
  end

  def income_expenditure_rating
    ratio = total_expenditure / total_income
    case ratio
    when 0...0.1 then 'A'
    when 0.1...0.3 then 'B'
    when 0.3...0.5 then 'C'
    else 'D'
    end
  end
end
