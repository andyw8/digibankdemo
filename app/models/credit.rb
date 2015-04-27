class Credit < ActiveRecord::Base
  belongs_to :account
  belongs_to :emitting_account, class_name: "Account"

  after_create :update_account_balance

  def to_partial_path
    "transactions/credit"
  end

  def account_currency_unit
    account.currency_unit
  end

  def emitter
    emitting_account.user
  end

  private

  def update_account_balance
    account.update_attributes!(balance: account_balance)
  end
end
