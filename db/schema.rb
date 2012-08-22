# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120628154648) do

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.string   "serial"
    t.string   "iosv"
    t.string   "iosi"
    t.string   "ipseg"
    t.string   "gwaddr"
    t.string   "wanip"
    t.string   "mgmtip"
    t.string   "notes"
    t.string   "iosu"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offices", :force => true do |t|
    t.string   "address"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.string   "os"
    t.string   "phys"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "servers_softwares", :id => false, :force => true do |t|
    t.integer "server_id"
    t.integer "software_id"
  end

  create_table "softwares", :force => true do |t|
    t.string   "name"
    t.float    "version"
    t.string   "status"
    t.integer  "server_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "softwares", ["server_id"], :name => "index_softwares_on_server_id"

end
