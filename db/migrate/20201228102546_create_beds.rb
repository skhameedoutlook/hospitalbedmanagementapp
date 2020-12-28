class CreateBeds < ActiveRecord::Migration[6.0]
  def change
    create_table :beds do |t|
      t.string :bedtype
      t.integer :quantity

      t.timestamps
    end
  end
end
