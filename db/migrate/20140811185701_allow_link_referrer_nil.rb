class AllowLinkReferrerNil < ActiveRecord::Migration
  def change
    change_column :link_clicks, :referrer, :string, :null => true
  end

  def up
    change_column :link_clicks, :referrer, :string, :null => true
  end

  def down
    change_column :link_clicks, :referrer, :string, :null => false
  end
end
