class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.integer :request_transaction_id, null: false
      t.integer :merchant_id, null: false
      t.integer :user_id, null: false
      t.string :card_number, null: false
      t.datetime :transaction_date, null: false
      t.float :transaction_amount, null: false
      t.integer :device_id, null: false
      t.boolean :has_cbk, default: false
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
