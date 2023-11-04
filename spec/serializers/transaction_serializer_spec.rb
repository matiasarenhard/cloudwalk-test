require 'rails_helper'

RSpec.describe TransactionSerializer do
  let!(:transaction) do
    Transaction.create({
                         request_transaction_id: 1,
                         merchant_id: 2,
                         user_id: 3,
                         card_number: '1234-5678-9012-3456',
                         transaction_date: '2023-11-03',
                         transaction_amount: 100.0,
                         device_id: 4,
                         has_cbk: false,
                         status: true
                       })
  end
  let!(:transaction_false) do
    Transaction.create({
                         request_transaction_id: 1,
                         merchant_id: 2,
                         user_id: 3,
                         card_number: '1234-5678-9012-3456',
                         transaction_date: '2023-11-03',
                         transaction_amount: 100.0,
                         device_id: 4,
                         has_cbk: false,
                         status: false
                       })
  end
  subject { described_class.new(transaction) }
  let(:subject_false) { TransactionSerializer.new(transaction_false) }

  it 'serializes the transaction_id correctly' do
    expect(subject.serializable_hash[:data][:attributes][:transaction_id]).to eq(transaction.request_transaction_id)
  end

  it 'serializes the recommendation correctly when status is true' do
    expect(subject.serializable_hash[:data][:attributes][:recommendation]).to eq('approve')
  end

  it 'serializes the recommendation correctly when status is false' do
    expect(subject_false.serializable_hash[:data][:attributes][:recommendation]).to eq('deny')
  end
end
