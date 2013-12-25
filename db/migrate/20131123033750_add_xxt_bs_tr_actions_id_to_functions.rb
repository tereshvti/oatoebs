class AddXxtBsTrActionsIdToFunctions < ActiveRecord::Migration
  def change
    add_column :functions, :xxt_bs_tr_actions_v_id, :integer
  end
end
