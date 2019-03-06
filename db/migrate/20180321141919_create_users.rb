class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :name
    add_index :users, :email
    add_index :users, :deleted_at
  end
end
