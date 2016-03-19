class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text :bio
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
