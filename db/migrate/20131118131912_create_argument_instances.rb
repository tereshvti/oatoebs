class CreateArgumentInstances < ActiveRecord::Migration
  def change
    create_table :argument_instances do |t|
      t.string :value
      t.integer :step_id
      t.integer :argument_id

      t.timestamps
    end
  end
end
