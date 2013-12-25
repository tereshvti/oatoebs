class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :function_id
      t.integer :script_id
      t.integer :previous_step_id

      t.timestamps
    end
  end
end
