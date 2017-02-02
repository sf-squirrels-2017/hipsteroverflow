class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.references :user
      t.references :question

      t.timestamps
    end
  end
end
