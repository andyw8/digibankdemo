class Account < ActiveRecord::Base
  CURRENCY_UNITS = { euros: "€" }.freeze

  has_many :transactions
  belongs_to :user

  def currency_unit
    CURRENCY_UNITS.fetch("#{currency}".to_sym)
  end
end
