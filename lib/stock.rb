class Stock < ActiveRecord::Base
    has_many :purchases
    has_many :shareholders, through: :purchases

    def to_s
        "#{self.id}: #{self.company_name}, Abbreviation: #{self.abbreviation}, Price: #{self.price}"
    end
end