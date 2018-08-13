class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.float :price_per_day

      t.timestamps
    end
  end
end
