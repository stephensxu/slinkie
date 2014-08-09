class CreateLinkClicks < ActiveRecord::Migration
  def change
    create_table :link_clicks do |t|
      t.references :link, :null => false
      t.string :referrer, :null => false

      t.timestamps :null => false
    end
  end
end
