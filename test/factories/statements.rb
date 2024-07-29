FactoryBot.define do
  factory :statement do
    user { association(:user) }

    trait :with_income do
      incomes { [association(:income)] }
    end

    trait :with_expenditure do
      expenditures { [association(:expenditure)] }
    end
  end
end
