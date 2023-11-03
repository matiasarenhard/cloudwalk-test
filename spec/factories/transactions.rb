FactoryBot.define do
  factory :transaction do
    request_transaction_id { 1 }
    merchant_id { 1 }
    user_id { 1 }
    card_number { "MyString" }
    transaction_date { "2023-11-03 13:02:58" }
    transaction_amount { 1.5 }
    device_id { 1 }
    has_cbk { false }
  end
end
