class AddAddressToTools < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :Address, :string
  end
end
