class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.decimal :price
      t.string :image
      t.integer :discount
      t.text :description
      t.integer :quantity
      t.integer :status

      t.timestamps
    end
  end
end
