class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.references :user

      t.timestamps
  end
end
