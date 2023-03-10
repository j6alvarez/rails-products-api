class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name,              null: false, default: ""
      t.string :email,             null: false, default: ""

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :id,               unique: true
  end
end
