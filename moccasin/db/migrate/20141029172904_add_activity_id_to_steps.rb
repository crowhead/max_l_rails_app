class AddActivityIdToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :activity_id, :integer
  end
end
