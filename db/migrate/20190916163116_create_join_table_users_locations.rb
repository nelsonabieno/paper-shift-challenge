class CreateJoinTableUsersLocations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :locations, column_options: {type: :uuid} do |t|
      t.index [:user_id, :location_id]
    end
  end
end
