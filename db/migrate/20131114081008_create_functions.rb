class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.integer :tr_operation_id
      t.integer :xxt_bs_operation_id 
      t.integer :c_code_id
      t.string :name

      t.timestamps
    end
  end
end
