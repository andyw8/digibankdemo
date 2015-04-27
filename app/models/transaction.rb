class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :operation, polymorphic: true

  def self.ordered_by_descending_created_at
    order(created_at: :desc)
  end
end
