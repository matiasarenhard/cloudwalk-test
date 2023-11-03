# frozen_string_literal: true

class TransactionValidator
  include ActiveModel::Model

  attr_accessor :request_transaction_id, :merchant_id, :user_id,
                :card_number, :transaction_date, :transaction_amount, :device_id, :has_cbk

  validates :request_transaction_id, presence: true
  validates :merchant_id, presence: true
  validates :user_id, presence: true
  validates :card_number, presence: true
  validates :transaction_date, presence: true
  validates :transaction_amount, presence: true
  validates :device_id, presence: true

  def attributes
    {
      request_transaction_id:,
      merchant_id:,
      user_id:,
      card_number:,
      transaction_date:,
      transaction_amount:,
      device_id:,
      has_cbk:
    }
  end
end
