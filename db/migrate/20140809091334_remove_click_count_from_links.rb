class RemoveClickCountFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :clicks_count, :integer
  end
end
