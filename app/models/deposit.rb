class Deposit < ActiveRecord::Base
  belongs_to :account

  after_create :update_account_balance

  def to_partial_path
    "transactions/deposit"
  end

  def account_currency_unit
    account.currency_unit
  end

  private

  def update_account_balance
    account.update_attributes!(balance: account_balance)
  end
end
