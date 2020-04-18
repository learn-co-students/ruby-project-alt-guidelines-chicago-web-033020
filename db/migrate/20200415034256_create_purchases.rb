class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :shareholder_id
      t.integer :stock_id
      t.integer :quantity
    end
  end
end
