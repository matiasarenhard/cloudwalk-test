# spec/validators/transaction_validator_spec.rb

require 'rails_helper'

RSpec.describe TransactionValidator do
  describe 'TransactionValidator' do
    subject { described_class.new }

    it 'is valid when all required string attributes are present' do
      subject.request_transaction_id = 1
      subject.merchant_id = 123_123
      subject.user_id = 123_123
      subject.card_number = '650516******7004'
      subject.transaction_date = Time.now
      subject.transaction_amount = 100.0
      subject.device_id = 123_123

      expect(subject).to be_valid
    end

    it 'is invalid when required string attributes are missing' do
      expect(subject).not_to be_valid
      expect(subject.errors[:request_transaction_id]).to include("can't be blank")
      expect(subject.errors[:merchant_id]).to include("can't be blank")
      expect(subject.errors[:user_id]).to include("can't be blank")
      expect(subject.errors[:card_number]).to include("can't be blank")
      expect(subject.errors[:transaction_date]).to include("can't be blank")
      expect(subject.errors[:transaction_amount]).to include("can't be blank")
      expect(subject.errors[:device_id]).to include("can't be blank")
    end
  end
end
