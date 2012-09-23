class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :passage
      t.text :comment
      t.integer :user_id
      t.boolean :public

      t.timestamps
    end
  end
end
