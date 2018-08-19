class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |u|
      u.string :name
      u.string :email
      u.string :password_hash
      u.datetime :created_at
      u.datetime :updated_at
      # u.has_many :posts
  end

  create_table :posts do |po|
    # po.references :user
    po.string :post_title
    po.string :description
    po.string :image_url
  end

  add_index :users, :email, unique: true
end
end
