class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :short_name, null: false
      t.string :url, null: false

      t.timestamps null:false
    end

    add_index :links, :short_name, :unique => true
  end
end
