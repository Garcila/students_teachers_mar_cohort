 class AddEmailTeachers < ActiveRecord::Migration

  def change
    change_table :teachers do |t|
    	t.string :email
    end
  end
end