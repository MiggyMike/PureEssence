class RenamePriceInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :prince, :price
  end
end
