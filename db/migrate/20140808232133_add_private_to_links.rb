class AddPrivateToLinks < ActiveRecord::Migration
  def change
    add_column :links, :private, :boolean, :default => false, :null => false
  end
end
