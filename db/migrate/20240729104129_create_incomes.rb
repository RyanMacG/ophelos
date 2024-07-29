class CreateIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
