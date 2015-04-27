class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.references :account, index: true, foreign_key: true
      t.money :account_balance
      t.money :amount

      t.timestamps null: false
    end
  end
end
