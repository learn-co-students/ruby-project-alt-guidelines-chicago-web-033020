class CreateShareholders < ActiveRecord::Migration[5.2]
  def change
    create_table :shareholders do |t|
      t.string :name
      t.string :city
    end
  end
end
