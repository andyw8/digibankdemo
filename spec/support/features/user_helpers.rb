module UserHelpers
  def user_with_account_balance_of(balance)
    create :user, account: account_with_balance(balance)
  end

  def account_with_balance(balance)
    create :account, balance: balance
  end
end
