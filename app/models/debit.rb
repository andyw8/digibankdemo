class Debit < ActiveRecord::Base
  belongs_to :account
  belongs_to :receiving_account, class_name: "Account"

  after_create :update_account_balance

  def to_partial_path
    "transactions/debit"
  end

  def receiver
    receiving_account.user
  end

  private

  def update_account_balance
    account.update_attributes!(balance: account_balance)
  end
end
