# frozen_string_literal: true

class TransactionAmountPeriodValidator
  attr_accessor :transaction

  def initialize(params)
    @transaction = TransactionValidator.new(params[:transaction_attributes])
    @period = 22
    @amount = 5000
  end

  def valid
    return false if amount_bigest?
    return false if period_bigest?

    true
  end

  private

  def amount_bigest?
    transaction.transaction_amount >= @amount
  end

  def period_bigest?
    timestamp = Time.parse(transaction.transaction_date)
    timestamp.hour >= 22
  end
end
