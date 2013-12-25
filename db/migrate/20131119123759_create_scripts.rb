class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :name
      t.integer :suite_id
      t.string :responsible

      t.timestamps
    end
  end
end
