class AddAboutMeText < ActiveRecord::Migration
  def up
  	add_column :users, :about_me, :text, :null => true
  end

  def down
  	remove_column :users, :about_me
  end
end
