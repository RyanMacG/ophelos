FactoryBot.define do
  factory :statement do
    user { 'foo@example.com' }

    trait :with_income do
      incomes { [association(:income)] }
    end

    trait :with_expenditure do
      expenditures { [association(:expenditure)] }
    end
  end
end
