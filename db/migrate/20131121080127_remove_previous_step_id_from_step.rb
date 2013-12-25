class RemovePreviousStepIdFromStep < ActiveRecord::Migration
  def change
    remove_column :steps, :previous_step_id
  end
end
