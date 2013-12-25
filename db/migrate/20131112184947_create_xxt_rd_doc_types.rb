class CreateXxtRdDocTypes < ActiveRecord::Migration
  def change
    create_table :xxt_rd_doc_types do |t|
      t.string :code
      t.string :name
      t.string :group_document

      t.timestamps
    end
  end
end
