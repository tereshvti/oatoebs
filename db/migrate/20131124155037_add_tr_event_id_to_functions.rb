class AddTrEventIdToFunctions < ActiveRecord::Migration
  def change
    add_column :functions, :tr_event_id, :integer
  end
end
