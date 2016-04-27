class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false
      t.string :location
      t.string :gender, null: false
      t.string :age, null: false

      t.timestamps null: false
    end
    add_index :personals, :user_id
    add_foreign_key :personals, :users
  end
end
