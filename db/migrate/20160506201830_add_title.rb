class AddTitle < ActiveRecord::Migration
  def change
    add_column :messages, :title, :string
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end
end
