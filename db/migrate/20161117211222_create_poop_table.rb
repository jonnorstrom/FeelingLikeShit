class CreatePoopTable < ActiveRecord::Migration[5.0]
  def change
    create_table :poops do |t|
      t.string :type, null: false
      t.timestamps null: false
    end
  end
end
