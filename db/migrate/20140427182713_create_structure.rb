class CreateStructure < ActiveRecord::Migration
  def change
    create_table "seasons" do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "active",     default: false
    end

    create_table "series" do |t|
      t.string   "name"
      t.integer  "season_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "series_tracks" do |t|
      t.integer  "series_id"
      t.integer  "track_id"
      t.string   "name"
      t.date     "date"
      t.integer  "week"
      t.string   "duration"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "night",      default: false
    end

    create_table "srs_track_values" do |t|
      t.integer  "user_id"
      t.integer  "series_track_id"
      t.string   "value"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "teams" do |t|
      t.string   "name"
      t.string   "slug"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "tracks" do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "user_seasons" do |t|
      t.integer  "user_id"
      t.integer  "season_id"
      t.string   "series_names"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users" do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "track_ids"
      t.integer  "team_id"
    end
  end
end
