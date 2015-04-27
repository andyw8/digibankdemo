class Dashboard
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def balance
    account.balance
  end

  def currency
    account.currency_unit
  end

  def transactions
    Transaction.
      where(account: account).
      ordered_by_descending_created_at.
      map(&:operation)
  end
end
