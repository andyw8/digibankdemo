require_relative "../../app/models/dashboard"

describe Dashboard, "#account" do
  it "returns the passed in account" do
    account = double(:account)

    dashboard = Dashboard.new(account)

    expect(dashboard.account).to eq account
  end
end

describe Dashboard, "#account_balance" do
  it "returns the balance of the passed in account" do
    account = double(:account, balance: BigDecimal.new("0.0"))

    dashboard = Dashboard.new(account)

    expect(dashboard.account_balance).to eq account.balance
  end
end

describe Dashboard, "#account_currency" do
  it "returns the unit symbol mapping of the account currency" do
    account = double(:account, currency: "euros")

    dashboard = Dashboard.new(account)

    expect(dashboard.account_currency).to eq "€"
  end
end
