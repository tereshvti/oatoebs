class CreateTrOperations < ActiveRecord::Migration
  def change
    create_table :tr_operations do |t|
		t.string :spto45roottag	  
		t.text :summary
		t.string :departament 
		t.string :role
		t.string :segn6
		t.string :segn0 
		t.string :segn1
		t.string :segn2
		t.string :segn3
		t.string :segn4
		t.string :segn5
		t.text :comment 
		t.string :indoc 
		t.string :indepartament
		t.string :inrole
		t.string :inlocelecton
		t.string :inlocpaper 
		t.string :outdoc 
		t.string :outdepartament
		t.string :outrole
		t.string :outlocelectron
		t.string :outlocpaper 
		t.string :sposobizmer
		t.string :dorabotka
		t.text :params
		t.text :termop
		t.string :status
		t.datetime :gendate 
		t.string :revision
		t.datetime :revdate
		t.string :spto45roottag
		t.text :keywords
		t.string :eventbegin
		t.string :eventend
		
		t.timestamps
    end
  end
end
