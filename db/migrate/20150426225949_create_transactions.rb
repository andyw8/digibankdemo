class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :account, index: true, foreign_key: true
      t.integer :operation_id
      t.string :operation_type

      t.timestamps null: false
    end
    add_index :transactions, :operation_id
    add_index :transactions, :operation_type
  end
end
