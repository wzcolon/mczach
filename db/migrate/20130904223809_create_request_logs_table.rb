class CreateRequestLogsTable < ActiveRecord::Migration
  def up
    create_table :request_logs, force: true do |t|
      t.string  :application_name,   null: false
      t.float   :time_in_ruby,       null: false
      t.float   :time_in_db,         null: false
      t.float   :time_rendering,     null: false
      t.float   :request_time,       null: false

      t.timestamps
    end
  end

  def down
    drop_table :request_logs
  end
end
