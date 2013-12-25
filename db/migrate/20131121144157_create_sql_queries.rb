class CreateSqlQueries < ActiveRecord::Migration
  def change
    create_table :sql_queries do |t|
      t.string :formname
      t.string :blockname
      t.string :sql

      t.timestamps
    end
  end
end
