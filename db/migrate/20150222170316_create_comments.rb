class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :commenter
      t.references :user
      t.references :recipe

      t.timestamps null: false
    end
  end
end
