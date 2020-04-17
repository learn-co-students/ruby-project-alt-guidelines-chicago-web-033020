class Purchase < ActiveRecord::Base
    belongs_to :shareholder
    belongs_to :stock

    def to_s
        "#{self.id}: shareholder name: #{self.shareholder.name}, company name: #{self.stock.company_name}, quantity: #{self.quantity}"
    end
end