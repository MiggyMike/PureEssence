class RenameScentInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :scent, :scents
  end
end
