# frozen_string_literal: true

class TransactionInARowValidator
  attr_accessor :transaction

  def initialize(params)
    @transaction = TransactionValidator.new(params[:transaction_attributes])
  end

  def valid
    return false if same_transaction?
    return false if many_transactions_between_a_minute?

    true
  end

  private

  def same_transaction?
    transactions = Transaction.where(card_number: transaction.card_number,
                                     transaction_date: transaction.transaction_date,
                                     transaction_amount: transaction.transaction_amount)
    return false if transactions.nil?

    (transactions.size >= 1)
  end

  def many_transactions_between_a_minute?
    create_date_range_start = Time.parse(transaction.transaction_date)
    create_date_range_end = Time.parse(transaction.transaction_date) + 2.minute
    transactions = Transaction.where(
      card_number: transaction.card_number,
      transaction_date: (create_date_range_start..create_date_range_end),
      transaction_amount: transaction.transaction_amount
    )
    transactions.present?
  end
end
