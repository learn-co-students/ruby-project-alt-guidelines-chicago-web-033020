class Purchase < ActiveRecord::Base
    belongs_to :shareholder
    belongs_to :stock
end