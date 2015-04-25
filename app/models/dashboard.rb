class Dashboard
  CURRENCY_MAP = { euros: "€" }.freeze

  attr_reader :account

  def initialize(account)
    @account = account
  end

  def account_balance
    account.balance
  end

  def account_currency
    CURRENCY_MAP.fetch("#{account.currency}".to_sym)
  end
end
