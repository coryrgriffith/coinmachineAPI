class ChangeValueToIntegerFromString < ActiveRecord::Migration[5.2]
  def change
    remove_column :coins, :value, :string
    add_column :coins, :value, :decimal, precision: 8, scale: 2
  end
end
