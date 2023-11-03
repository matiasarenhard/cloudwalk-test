FactoryBot.define do
  factory :transaction do
    request_transaction_id { 1_123_214 }
    merchant_id { 1_123_123 }
    user_id { 112_313 }
    card_number { '650516******7004' }
    transaction_date { '2023-11-03 13:02:58' }
    transaction_amount { 1.5 }
    device_id { 1 }
    has_cbk { false }
    status { false }
  end
end
