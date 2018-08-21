class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |u|
      u.string :first_name
      u.string :last_name
      u.string :user_name
      u.string :email
      u.string :birthdate
      u.string :image_url
      u.string :password_hash
      u.datetime :created_at
      u.datetime :updated_at
      u.string :description

  end

  create_table :posts do |po|
    po.string :owner
    po.string :post_title
    po.string :description
    po.string :image_url
    po.datetime :created_at
  end

  add_index :users, :email, unique: true
  add_index :users, :user_name, unique: true
end
end
