class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.string :name
      t.boolean :form
      t.string :description
      t.integer :function_id

      t.timestamps
    end
  end
end
