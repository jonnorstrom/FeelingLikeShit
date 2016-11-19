class ChangePoopType < ActiveRecord::Migration[5.0]
  def change
    rename_column :poops, :type, :desc
  end
end
