class CreateShareholders < ActiveRecord::Migration[5.2]
  def change
    create_table :Shareholders do |t|
      t.string :name
      t.string :city
    end
  end
end
