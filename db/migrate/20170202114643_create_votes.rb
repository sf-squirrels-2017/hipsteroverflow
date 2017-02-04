class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :votable_type
      t.integer :value
      t.integer :votable_id
      t.references :user

      t.timestamps
    end
  end
end
