# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < ApplicationController
      def create
        render json: {}, status: :ok
      end
    end
  end
end
