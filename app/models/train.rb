class Train < ActiveRecord::Base

	has_many :customers
	has_many :tickets

	validates_presence_of :name
	validates_uniqueness_of :name
	validates_length_of :capacity, minimum: 0
	validates_numericality_of :capacity
	validates_length_of :origin, maximum: 3
	validates_length_of :destination, maximum: 3

end
#we making sure it has a name!!! 
