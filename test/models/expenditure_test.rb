require 'test_helper'

class ExpenditureTest < ActiveSupport::TestCase
  test 'valid expenditure' do
    expenditure = build(:expenditure)
    assert expenditure.valid?
  end

  test 'invalid without name' do
    expenditure = build(:expenditure, name: nil)
    assert expenditure.invalid?
  end

  test 'invalid without amount' do
    expenditure = build(:expenditure, amount: 0)
    assert expenditure.invalid?
  end
end
