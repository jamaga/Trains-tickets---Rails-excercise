class Ticket < ActiveRecord::Base
#link ticket to customer and train
belongs_to :train #rails look in the DB for train
belongs_to :customer #
validates :train, presence: true
validates :customer, presence: true

validates_presence_of :customer
validates_presence_of :train

#custom validator to check for train time
validate :train_time

#check if train.time is in the past
	def train_time
		if train && train.time && train.time < Time.now #checks for train, if nul , will not go further, if train exists will check for train.time
			# train has already left, add error msg to errors field
			errors.add(:time, "train has already left")
		end
	end

	validate :check_capacity

	def check_capacity
		if train 
		number_of_tickets = train.tickets.count
		end
	end
end





