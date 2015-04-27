module DepositHelpers
  def create_deposit(amount:, receiver:)
    DepositTeller.new(amount: amount, receiver: receiver).deposit
  end
end
