class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.references :account, index: true, foreign_key: true
      t.money :amount

      t.timestamps null: false
    end
  end
end
