class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: { unique: true }
      t.string :password
      t.string :usertype

      t.timestamps
    end
  end
end
