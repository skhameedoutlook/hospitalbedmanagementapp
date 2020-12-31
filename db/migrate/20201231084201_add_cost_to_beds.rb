class AddCostToBeds < ActiveRecord::Migration[6.0]
  def change
    add_column :beds, :cost, :float, :default => 10.00
  end
end
