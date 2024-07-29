class AddUserStatementsRelation < ActiveRecord::Migration[7.1]
  def change
    add_reference :statements, :user, foreign_key: true
  end
end
