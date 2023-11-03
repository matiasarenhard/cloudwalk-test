# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < ApplicationController
      before_action :transaction_params, only: [:create]

      def create
        update_params = update_hash_params(transaction_params)
        create_transaction = CreateTransactionService.new.call(params: update_params)

        unless create_transaction.success?
          return render json: { errors: create_transaction.failure },
                        status: :unprocessable_entity
        end
        render json: create_transaction, status: :ok
      end

      private

      def transaction_params
        params.permit(:transaction_id, :merchant_id, :user_id, :card_number,
                      :transaction_date, :transaction_amount, :device_id, :has_cbk)
      end

      def update_hash_params(new_transaction_params)
        new_transaction_params[:request_transaction_id] = transaction_params[:transaction_id]
        new_transaction_params.delete(:transaction_id)
        new_transaction_params
      end
    end
  end
end
