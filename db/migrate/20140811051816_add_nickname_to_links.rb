class AddNicknameToLinks < ActiveRecord::Migration
  def change
    add_column :links, :nickname, :string, :null => false, :default => "I need a name"
  end
end
