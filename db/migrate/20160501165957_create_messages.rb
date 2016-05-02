class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body, null: false
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.integer :personals_id, null: false

      t.timestamps null: false
    end
    add_foreign_key :messages, :personals
  end
end
