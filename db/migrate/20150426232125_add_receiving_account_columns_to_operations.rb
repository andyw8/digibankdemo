class AddReceivingAccountColumnsToOperations < ActiveRecord::Migration
  def change
    add_column :debits, :receiving_account_id, :integer
    add_column :credits, :emitting_account_id, :integer
  end
end
