class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity,     null: false, default: 1
      t.decimal :total_amount,   null: false
      t.string :currency,        null: false, default: "USD"

      t.timestamps
    end
  end
end
