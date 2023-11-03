# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  describe 'POST #create' do
    let!(:user) { User.create!(email: 'teste@gmail.com', password: '1234567') }
    let(:valid_params) do
      {
        transaction_id: 1,
        merchant_id: 2,
        user_id: 3,
        card_number: '650516******7004',
        transaction_date: '2023-11-03',
        transaction_amount: 100.0,
        device_id: 4,
        has_cbk: false
      }
    end

    let(:valid_headers) do
      {
        'Authorization' => user.authentication_token,
        'Content-Type' => 'application/json'
      }
    end

    let(:invalid_headers) do
      {
        'Authorization' => ''
      }
    end

    it 'creates a transaction successfully with valid params and authorization' do
      request.headers.merge!(valid_headers)

      post :create, params: valid_params

      expect(response).to have_http_status(:ok)
    end

    it 'returns unprocessable_entity status with invalid params and authorization' do
      request.headers.merge!(valid_headers)

      post :create, params: valid_params.except(:transaction_id)

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns unauthorized status with invalid params and authorization' do
      request.headers.merge!(invalid_headers)

      post :create, params: valid_params

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
