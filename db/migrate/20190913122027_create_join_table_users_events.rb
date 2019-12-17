class CreateJoinTableUsersEvents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :events, column_options: { type: :uuid} do |t|
      t.index [:user_id, :event_id]
    end
  end
end



