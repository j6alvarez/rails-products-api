class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name,          null: false, default: ""
      t.text :image,           null: false, default: ""
      t.decimal :price,        null: false, default: 0.0
      t.string :currency,      null: false, default: "USD"
      t.integer :quantity,     null: false, default: 1

      t.timestamps
    end

    add_index :products, :id,               unique: true
  end
end
