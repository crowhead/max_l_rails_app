class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string do |t|
      t.string :remember_token
    end
    add_index :users, :remember_token
  end
end
