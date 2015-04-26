class TransferForm
  include ActiveModel::Model

  attr_accessor :amount, :message, :receiver

  validates :amount, presence: true
  validates :receiver, presence: true
  validate :emitting_user_has_sufficient_funds

  def initialize(emitting_user, attributes = {})
    @emitting_user = emitting_user
    @amount = attributes[:amount]
    @receiver = attributes[:receiver]
  end

  def submit
    if valid?
      save_transactions
    end
  end

  def receiving_users_list
    @_allowed_users ||= User.all.reject { |user| user == emitting_user }
  end

  private

  attr_reader :emitting_user

  def amount_to_transfer
    BigDecimal.new(amount)
  end

  def receiving_user
    User.includes(:account).find(receiver)
  end

  def receiving_account
    receiving_user.account
  end

  def emitting_account
    emitting_user.account
  end

  def debit
    Debit.new(
      account: emitting_account,
      account_balance: emitting_account.balance -= amount_to_transfer,
      amount: amount_to_transfer,
      receiving_account: receiving_account,
    )
  end

  def credit
    Credit.new(
      account: receiving_account,
      account_balance: receiving_account.balance += amount_to_transfer,
      amount: amount_to_transfer,
      emitting_account: emitting_account
    )
  end

  def save_transactions
    ActiveRecord::Base.transaction do
      Transaction.create!(account: emitting_account, operation: debit)
      Transaction.create!(account: receiving_account, operation: credit)
    end
  end

  def emitting_user_has_sufficient_funds
    if (emitting_account.balance - amount_to_transfer) > BigDecimal.new("0.01")
      true
    else
      errors.add(
        :amount,
        "You do not have sufficient funds to make this transfer"
      )
    end
  end
end
