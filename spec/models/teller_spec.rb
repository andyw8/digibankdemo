require "rails_helper"

describe DepositTeller, "#deposit" do
  it "creates a deposit to the specified account" do
    account = create :account
    receiver = create :user, account: account
    amount = "1"
    mock_deposit = double(:mock_deposit)

    expect(Deposit).to receive(:new).and_return(mock_deposit)
    expect(Transaction).to receive(:create!).
      with(account: account, operation: mock_deposit)

    DepositTeller.new(amount: amount, receiver: receiver).deposit
  end
end
