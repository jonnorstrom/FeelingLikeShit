class AddVotesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :poop_id, null: false
      t.timestamps null: false
    end
  end
end
