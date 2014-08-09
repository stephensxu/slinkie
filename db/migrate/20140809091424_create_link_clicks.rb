class CreateLinkClicks < ActiveRecord::Migration
  def change
    create_table :link_clicks do |t|
      t.reference :link
      t.string :referrer

      t.timestamps
    end
  end
end
