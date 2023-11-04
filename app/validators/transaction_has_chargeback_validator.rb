# frozen_string_literal: true

class TransactionHasChargebackValidator
  attr_accessor :transaction

  def initialize(params)
    @transaction = TransactionValidator.new(params[:transaction_attributes])
  end

  def valid
    return false if user_has_chargeback?
    return false if card_has_chargeback?

    true
  end

  private

  def user_has_chargeback?
    Transaction.where(user_id: transaction.user_id, has_cbk: true).present?
  end

  def card_has_chargeback?
    Transaction.where(card_number: transaction.card_number, has_cbk: true).present?
  end
end
