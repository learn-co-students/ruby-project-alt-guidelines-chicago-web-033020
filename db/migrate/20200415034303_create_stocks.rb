class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :Stocks do |t|
      t.string :company_name
      t.string :abbreviation
      t.integer :price
    end
  end
end
