class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :serial
      t.string :iosv
      t.string :iosi
      t.string :ipseg
      t.string :gwaddr
      t.string :wanip
      t.string :mgmtip
      t.string :notes
      t.string :iosu

      t.timestamps
    end
  end
end
