class AddScentToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :scent, :string
  end
end
