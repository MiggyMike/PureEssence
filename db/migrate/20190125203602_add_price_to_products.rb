class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prince, :decimal
  end
end
