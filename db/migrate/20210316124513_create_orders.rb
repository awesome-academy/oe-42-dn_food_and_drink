class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :user_name
      t.string :user_phone
      t.string :user_address
      t.integer :status
      t.decimal :amount
      t.text :messages

      t.timestamps
    end
  end
end
