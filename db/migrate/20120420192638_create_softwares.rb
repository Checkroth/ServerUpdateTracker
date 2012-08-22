class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      t.float :version
      t.integer :status
      t.references :server

      t.timestamps
    end
    add_index :softwares, :server_id
  end
end
