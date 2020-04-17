class Shareholder < ActiveRecord::Base
    has_many :purchases
    has_many :stocks, through: :purchases

    def to_s 
        "#{self.id}: #{self.name}, From: #{self.city}"
    end
end