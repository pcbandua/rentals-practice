class ChangeSqaureColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :homes, :sqaure_feet, :square_feet
  end
end
