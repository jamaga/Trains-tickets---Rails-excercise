class RenameDistinationationn < ActiveRecord::Migration
  def change
  	rename_column :trains, :destinastination, :destination
  end
end
