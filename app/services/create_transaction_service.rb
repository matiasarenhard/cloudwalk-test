# frozen_string_literal: true

class CreateTransactionService
  include Dry::Transaction

  step :validate_params
  map :find_or_create_transaction
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

  def find_or_create_transaction(input)
    ActiveRecord::Base.transaction do
      Transaction.create(input[:transaction_attributes])
    end
  end

  def serialize_transaction(input)
    TransactionSerializer.new(input).serializable_hash
  end
end
