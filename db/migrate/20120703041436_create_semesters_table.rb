class CreateSemestersTable < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.date :starting
 	    t.date :ending

 	    t.references :class_group

 	    t.timestamps
 	  end
  end
end