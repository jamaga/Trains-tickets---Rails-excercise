class City < ActiveRecord::Base
	#Look at the DB for all customers with our city_id
	has_many :customers
end
