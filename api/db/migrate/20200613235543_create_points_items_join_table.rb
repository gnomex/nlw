class CreatePointsItemsJoinTable < ActiveRecord::Migration[6.0]
  def change
      # If you want to add an index for faster querying through this join:
    create_join_table :points, :items do |t|
      t.index :point_id
      t.index :item_id
    end
  end
end
