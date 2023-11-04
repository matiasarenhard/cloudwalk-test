# frozen_string_literal: true

class CreateTransactionService
  include Dry::Transaction

  step :validate_params
  step :validate_transaction_amount_period
  step :validate_transaction_has_chargeback
  step :validate_transaction_in_a_row
  map :create_transaction
  map :serialize_transaction

  private

  def validate_params(input)
    transaction_validator = TransactionValidator.new(input[:params])
    if transaction_validator.valid?
      Success(transaction_attributes: transaction_validator.attributes)
    else
      Failure(transaction_validator.errors.full_messages)
    end
  end

  def validate_transaction_amount_period(input)
    transaction_amount_period = TransactionAmountPeriodValidator.new(input)
    if transaction_amount_period.valid
      Success(transaction_attributes: input[:transaction_attributes])
    else
      Failure('now is after 10 PM or amount bigest 5000')
    end
  end

  def validate_transaction_has_chargeback(input)
    transaction_has_chargeback = TransactionHasChargebackValidator.new(input)
    if transaction_has_chargeback.valid
      Success(transaction_attributes: input[:transaction_attributes])
    else
      Failure('user has chargeback')
    end
  end

  def validate_transaction_in_a_row(input)
    transaction_in_a_row_validator = TransactionInARowValidator.new(input)
    if transaction_in_a_row_validator.valid
      Success(transaction_attributes: input[:transaction_attributes].merge(status: true))
    else
      Failure('many transactions in a row')
    end
  end

  def create_transaction(input)
    ActiveRecord::Base.transaction do
      Transaction.create(input[:transaction_attributes])
    end
  end

  def serialize_transaction(input)
    TransactionSerializer.new(input).serializable_hash
  end
end
