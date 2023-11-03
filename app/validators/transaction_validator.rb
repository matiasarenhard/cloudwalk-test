# frozen_string_literal: true

class TransactionValidator
  include ActiveModel::Model

  attr_accessor :request_transaction_id, :merchant_id, :user_id,
                :card_number, :transaction_date, :transaction_amount, :device_id, :has_cbk

  validates :request_transaction_id, presence: true, numericality: { only_integer: true }
  validates :merchant_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :card_number, presence: true, length: { is: 16 }, allow_blank: false
  validates :transaction_date, presence: true
  validates :transaction_amount, presence: true, numericality: true
  validates :device_id, presence: true, numericality: { only_integer: true }

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
