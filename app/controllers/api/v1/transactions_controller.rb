# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < ApplicationController
      before_action :transaction_params, only: [:create]

      def create
        render json: {}, status: :ok
      end

      private

      def transaction_params
        params.permit(:transaction_id, :merchant_id, :user_id, :card_number,
                      :transaction_date, :transaction_amount, :device_id, :has_cbk)
      end
    end
  end
end
