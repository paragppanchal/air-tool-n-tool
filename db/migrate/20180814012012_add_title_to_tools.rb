class AddTitleToTools < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :title, :string
  end
end
