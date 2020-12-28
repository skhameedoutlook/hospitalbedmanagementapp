class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :username
      t.string :bedtype
      t.integer :quantity
      t.boolean :requestcompleted
      t.boolean :checkedin
      t.datetime :checkintime
      t.boolean :checkedout
      t.datetime :checkouttime

      t.timestamps
    end
  end
end
