class CreateStatements < ActiveRecord::Migration[7.1]
  def change
    create_table :statements do |t|
      t.string :user

      t.timestamps
    end

    add_reference :incomes, :statement, foreign_key: true
    add_reference :expenditures, :statement, foreign_key: true
  end
end
