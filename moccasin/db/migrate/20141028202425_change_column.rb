class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean do |t|
      t.boolean :admin, default:false
    end
  end
end
