class AddCoordinatesToTools < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :latitude, :float
    add_column :tools, :longitude, :float
  end
end
