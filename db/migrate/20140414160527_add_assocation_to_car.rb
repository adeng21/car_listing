class AddAssocationToCar < ActiveRecord::Migration
  def change
    add_column :cars, :manufacturer_id, :integer
  end
end
