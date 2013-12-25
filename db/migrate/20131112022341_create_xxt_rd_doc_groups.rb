class CreateXxtRdDocGroups < ActiveRecord::Migration
  def change
    create_table :xxt_rd_doc_groups do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
