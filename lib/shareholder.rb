class Shareholder < ActiveRecord::Base
    has_many :purchases
    has_many :stocks, through: :purchases

    def to_s 
        "#{self.id}: Name: #{self.name}, From: #{self.city}"
    end
end