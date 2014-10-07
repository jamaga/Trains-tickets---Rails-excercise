class Customer < ActiveRecord::Base
	belongs_to :city #Rails will search for city_id column
	belongs_to :trains
	has_many :tickets
end


