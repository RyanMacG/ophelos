require 'test_helper'

class StatementTest < ActiveSupport::TestCase
  test 'valid statement' do
    statement = build(:statement, :with_income, :with_expenditure)
    assert statement.valid?
  end

  test 'invalid without user' do
    statement = build(:statement, :with_income, :with_expenditure, user: nil)
    assert statement.invalid?
  end

  test 'invalid without income' do
    statement = build(:statement, :with_expenditure)
    assert statement.invalid?
  end

  test 'invalid without expenditure' do
    statement = build(:statement, :with_income)
    assert statement.invalid?
  end
end
