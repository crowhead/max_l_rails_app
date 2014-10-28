class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string do |t|
    t.string :email
    end
  end
end
