class Shareholder < ActiveRecord::Base
    has_many :purchases
    has_many :stocks, through: :purchases
end