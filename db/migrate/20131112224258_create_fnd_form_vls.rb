class CreateFndFormVls < ActiveRecord::Migration
  def change
    create_table :fnd_form_vls do |t|
      t.integer :form_id
      t.string :form_name
      t.string :user_form_name

      t.timestamps
    end
  end
end
