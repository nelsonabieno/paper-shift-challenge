class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end
end
