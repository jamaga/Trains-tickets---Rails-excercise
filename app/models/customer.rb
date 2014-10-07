class Customer < ActiveRecord::Base
	belongs_to :trains
	has_many :tickets
end
