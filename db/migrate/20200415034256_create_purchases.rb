class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :Purchases do |t|
      t.integer :shareholder_id
      t.integer :company_id
      t.integer :quantity
    end
  end
end
