class AddNameToPassengers < ActiveRecord::Migration[8.0]
  def change
    add_column :passengers, :name, :string
  end
end
