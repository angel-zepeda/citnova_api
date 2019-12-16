class RemoveTableAreas < ActiveRecord::Migration[5.2]
  def change
    drop_table :areas
  end
end
