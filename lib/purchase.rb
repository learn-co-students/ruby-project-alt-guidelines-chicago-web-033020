class Purchase < ActiveRecord::Base
    belongs_to :shareholder
    belongs_to :stock

    def to_s
        "#{self.id}: Shareholder_Name: #{self.shareholder.name}, Company_Name: #{self.stock.company_name}, Quantity: #{self.quantity}"
    end
end