class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string do |t|
    t.string :email
    end
    add_index :users, :email, unique: false
  end
end
