class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user
      t.string :email
      t.string :password
      t.text :bio

      t.timestamps
    end
  end
end
