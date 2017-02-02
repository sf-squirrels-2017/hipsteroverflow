class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description, null: false
      t.references :user
      t.string :commentable_type
      t.integer :commentable_id

      t.timestamps
    end
  end
end
