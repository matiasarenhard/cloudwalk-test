class TransactionSerializer
  include JSONAPI::Serializer
  attribute :transaction_id, &:request_transaction_id

  attribute :recommendation do |object|
    object.status ? 'approve' : 'reprove'
  end
end
