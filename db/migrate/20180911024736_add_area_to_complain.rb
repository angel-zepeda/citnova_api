class AddAreaToComplain < ActiveRecord::Migration[5.2]
  def change
    add_reference :complains, :area, foreign_key: true
    add_index :area, :area_id
  end

end
