class ChangeAddressColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tools, :Address, :address
  end
end
