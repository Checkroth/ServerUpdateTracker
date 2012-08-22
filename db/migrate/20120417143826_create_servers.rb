class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :os
      t.string :phys

      t.timestamps
    end
  end
end
