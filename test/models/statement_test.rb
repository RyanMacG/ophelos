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

  test '#disposable_income' do
    statement = build(:statement)
    income_1 = create(:income, statement:)
    income_2 = create(:income, name: 'Investments', amount: 2000.00, statement:)
    expenditure_1 = create(:expenditure, statement:)
    expenditure_2 = create(:expenditure, name: 'Fees', amount: 10.10, statement:)
    statement.incomes << [income_1, income_2]
    statement.expenditures << [expenditure_1, expenditure_2]
    statement.save

    assert_equal 2979.91, statement.reload.disposable_income
  end

  class IncomeExpenditureRating < StatementTest
    test '#income_expenditure_rating with A rating' do
      statement = build(:statement)
      income_1 = create(:income, statement:)
      income_2 = create(:income, name: 'Investments', amount: 2000.00, statement:)
      statement.incomes << [income_1, income_2]
      statement.expenditures << [create(:expenditure, name: 'Fees', amount: 20.10, statement:)]
      statement.save

      assert_equal 'A', statement.reload.income_expenditure_rating
    end

    test '#income_expenditure_rating with B rating' do
      statement = build(:statement)
      income_1 = create(:income, statement:)
      income_2 = create(:income, name: 'Investments', amount: 2000.00, statement:)
      statement.incomes << [income_1, income_2]
      statement.expenditures << [create(:expenditure, name: 'Fees', amount: 310.10, statement:)]
      statement.save

      assert_equal 'B', statement.reload.income_expenditure_rating
    end

    test '#income_expenditure_rating with C rating' do
      statement = build(:statement)
      income_1 = create(:income, statement:)
      income_2 = create(:income, name: 'Investments', amount: 2000.00, statement:)
      statement.incomes << [income_1, income_2]
      statement.expenditures << [create(:expenditure, name: 'Fees', amount: 1300.10, statement:)]
      statement.save

      assert_equal 'C', statement.reload.income_expenditure_rating
    end

    test '#income_expenditure_rating with D rating' do
      statement = build(:statement)
      income_1 = create(:income, statement:)
      income_2 = create(:income, name: 'Investments', amount: 2000.00, statement:)
      statement.incomes << [income_1, income_2]
      statement.expenditures << [create(:expenditure, name: 'Fees', amount: 1500.10, statement:)]
      statement.save

      assert_equal 'D', statement.reload.income_expenditure_rating
    end
  end
end
