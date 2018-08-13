class RentalToBooking < ActiveRecord::Migration[5.2]
  def change
    rename_table :rentals, :bookings
  end
end
