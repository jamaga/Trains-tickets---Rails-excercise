class Ticket < ActiveRecord::Base
#link ticket to customer and train
belongs_to :train #rails look in the DB for train
belongs_to :customer #
validates :train, presence: true
validates :customer, presence: true

end


