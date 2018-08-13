class AddStatusToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :status, :string
  end
end
