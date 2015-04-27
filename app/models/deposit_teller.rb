class DepositTeller
  ALLOWED_OPERATIONS = %w(deposit).freeze

  def initialize(amount:, receiver:, requested_operation: nil)
    @amount = BigDecimal.new(amount)
    @receiver = receiver
    @requested_operation = requested_operation || :deposit
  end

  def deposit
    if allowed_operation?
      execute_operation
    end
  end

  private

  attr_reader :amount, :receiver, :requested_operation

  def execute_operation
    ActiveRecord::Base.transaction do
      Transaction.create!(account: account, operation: operation)
    end
  end

  def account
    receiver.account
  end

  def operation
    constantized_operation.new(
      account: account,
      account_balance: account.balance += amount,
      amount: amount
    )
  end

  def constantized_operation
    if allowed_operation?
      requested_operation.to_s.classify.constantize
    end
  end

  def allowed_operation?
    ALLOWED_OPERATIONS.include? requested_operation.to_s
  end
end
