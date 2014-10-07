class AddTimeToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :time, :datetime
  end
end
