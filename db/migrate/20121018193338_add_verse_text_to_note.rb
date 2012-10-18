class AddVerseTextToNote < ActiveRecord::Migration
  def change
  	add_column :notes, :verse, :text, :null => false, :default => ''
  end
end
