 class AddBelongsToTeacher < ActiveRecord::Migration

  def change
    change_table :students do |t|
    	t.belongs_to :teacher
    end
  end
end