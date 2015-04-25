class AddBalanceToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :balance, :money, null: false, default: 0
  end
end
