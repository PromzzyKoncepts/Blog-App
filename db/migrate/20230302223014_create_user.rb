class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://plus.unsplash.com/premium_photo-1666262369867-6e521a979afb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BsYXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'
      t.text :bio
      t.integer :posts_counter, default: 0

      t.timestamps
    end
  end
end
