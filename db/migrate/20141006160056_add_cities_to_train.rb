class AddCitiesToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :origin, :string
    add_column :trains, :destinastination, :string
    add_column :trains, :capacity, :integer
  end
end
