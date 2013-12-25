class CreateTrEvents < ActiveRecord::Migration
  def change
    create_table :tr_events do |t|
      t.string :spto45roottag
      t.string :doc
      t.string :action
      t.string :description
      t.string :eventbegin
      t.string :revision
      t.date :revdate

      t.timestamps
    end
  end
end
