# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090313215332) do

  create_table "data_sources", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "file"
    t.string   "host"
    t.string   "port"
    t.string   "user"
    t.string   "password"
    t.string   "dbname"
    t.string   "extent"
    t.string   "srs"
    t.boolean  "estimate_extent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layers", :force => true do |t|
    t.integer  "data_source_id"
    t.string   "name"
    t.string   "geometry_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "query"
    t.integer  "position",       :default => 1
    t.string   "title"
    t.string   "label_fields"
  end

  create_table "maps", :force => true do |t|
    t.string   "srs"
    t.string   "background_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", :force => true do |t|
    t.integer  "attachment_id"
    t.string   "type"
    t.string   "color"
    t.string   "inline_color"
    t.string   "outline_color"
    t.float    "inline_width"
    t.float    "outline_width"
    t.float    "width"
    t.integer  "top_zoom"
    t.integer  "bottom_zoom"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_outline"
    t.boolean  "show_inline"
    t.boolean  "show_labels"
    t.string   "label_font"
    t.string   "label_fill_color"
    t.string   "label_placement"
    t.integer  "label_halo_radius"
    t.integer  "label_size"
    t.integer  "label_wrap_width"
    t.string   "label_icon_file"
    t.integer  "label_dy"
    t.integer  "label_dx"
    t.string   "line_join"
    t.string   "line_cap"
    t.string   "line_dasharray"
    t.float    "line_opacity"
    t.string   "outline_join"
    t.string   "outline_cap"
    t.string   "inline_dasharray"
    t.string   "inline_join"
    t.boolean  "allow_overlap"
    t.string   "pattern_file"
    t.string   "label_halo_fill"
    t.integer  "label_max_char_angle_delta"
    t.integer  "label_min_distance"
    t.integer  "label_spacing"
    t.string   "shield_font"
    t.integer  "shield_min_distance"
    t.integer  "shield_size"
    t.string   "shield_fill_color"
    t.string   "shield_file"
    t.integer  "position",                   :default => 1
  end

  create_table "types", :force => true do |t|
    t.integer  "layer_id"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "filters"
    t.string   "title"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
