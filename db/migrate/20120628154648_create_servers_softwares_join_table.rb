class CreateServersSoftwaresJoinTable < ActiveRecord::Migration
  def up
    create_table :servers_softwares, :id => false do |t|
      t.integer :server_id
      t.integer :software_id
    end
   end
 

  def down
  drop_table :servers_softwares
  end
end
