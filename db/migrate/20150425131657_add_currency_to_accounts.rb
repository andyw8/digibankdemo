class AddCurrencyToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :currency, :string, null: false, default: "euros"
  end
end
