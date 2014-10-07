class AddReferenceToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :customer_id, :integer
    add_column :tickets, :train_id, :integer
  end
end
