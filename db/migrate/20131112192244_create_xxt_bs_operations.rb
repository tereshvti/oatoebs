class CreateXxtBsOperations < ActiveRecord::Migration
  def change
    create_table :xxt_bs_operations do |t|
      t.string :doc_group_code
      t.string :user_operation_name
      t.string :operation_id
      t.string :operation_code
      t.string :stored_proc_name
      t.string :techregl_code
      t.text   :techregl_select
      t.string :initialization_type
      t.string :group_oper_flag

      t.timestamps
    end
  end
end
