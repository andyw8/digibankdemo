class AddBalanceToOperations < ActiveRecord::Migration
  def change
    add_column :debits, :account_balance, :money
    add_column :credits, :account_balance, :money
  end
end
