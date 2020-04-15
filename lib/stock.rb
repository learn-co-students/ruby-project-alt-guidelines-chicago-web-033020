class Stock < ActiveRecord::Base
    has_many :purchases
    has_many :shareholders, through: :purchases
end