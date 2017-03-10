class CreateUsers < ActiveRecord::Migration
  # Write your migrations here

  create_table :users do |t|
    t.string :name
    t.string :password_digest
    t.integer :tickets
    t.integer :nausea
    t.integer :happiness
    t.integer :height

    t.timestamps null: false
  end
end
