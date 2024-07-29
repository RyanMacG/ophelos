require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  test 'valid income' do
    income = build(:income)
    assert income.valid?
  end

  test 'invalid without name' do
    income = build(:income, name: nil)
    assert income.invalid?
  end

  test 'invalid without amount' do
    income = build(:income, amount: 0)
    assert income.invalid?
  end
end
