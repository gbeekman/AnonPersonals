class AddPartnersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :partners, :integer, array: true, default: []
  end
end
