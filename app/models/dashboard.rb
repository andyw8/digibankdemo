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
    account.transactions.map(&:operation)
  end
end
