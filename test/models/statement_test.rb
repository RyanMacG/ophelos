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

  test '#total_income' do
    statement = build(:statement, :with_expenditure)
    income_1 = create(:income, statement:)
    income_2 = create(:income, name: 'Investments', amount: 2000.00, statement:)
    statement.incomes << [income_1, income_2]
    statement.save

    assert_equal 3000.00, statement.reload.total_income
  end

  test '#total_expenditure' do
    statement = build(:statement, :with_income)
    expenditure_1 = create(:expenditure, statement:)
    expenditure_2 = create(:expenditure, name: 'Fees', amount: 10.10, statement:)
    statement.expenditures << [expenditure_1, expenditure_2]
    statement.save

    assert_equal 20.09, statement.reload.total_expenditure
  end
end
