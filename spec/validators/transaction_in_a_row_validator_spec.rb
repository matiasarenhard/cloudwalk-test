require 'rails_helper'

RSpec.describe TransactionInARowValidator do
  describe 'TransactionInARowValidator valid true' do
    let(:transaction) do
      { transaction_attributes: { request_transaction_id: 2_342_357, merchant_id: 29_744, user_id: 97_051,
                                  card_number: '434505******9116', transaction_date: '2019-11-31T23:16:32.812632',
                                  transaction_amount: 373, device_id: 285_475, has_cbk: nil } }
    end

    subject { described_class.new(transaction) }

    it 'is valid' do
      expect(subject.valid).to eq(true)
    end
  end

  describe 'TransactionInARowValidator valid false' do
    let!(:transaction) do
      Transaction.create({ request_transaction_id: 2_342_357, merchant_id: 29_744, user_id: 97_051,
                           card_number: '434505******9116', transaction_date: '2019-11-31T23:16:32.812632',
                           transaction_amount: 373, device_id: 285_475, has_cbk: nil })
    end

    subject do
      described_class.new({ transaction_attributes: { request_transaction_id: 2_342_357, merchant_id: 29_744,
                                                      user_id: 97_051, card_number: '434505******9116',
                                                      transaction_date: '2019-11-31T23:16:32.812632',
                                                      transaction_amount: 373, device_id: 285_475, has_cbk: nil } })
    end

    it 'is invalid' do
      expect(subject.valid).to eq(false)
    end
  end
end
