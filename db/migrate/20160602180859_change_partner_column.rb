class ChangePartnerColumn < ActiveRecord::Migration
  def up
    change_column :users, :partners, :text
  end

  def down
    change_column :users, :partners, :integer
  end
end
