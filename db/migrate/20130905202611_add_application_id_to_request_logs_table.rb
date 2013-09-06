class AddApplicationIdToRequestLogsTable < ActiveRecord::Migration
  def up
    add_column :request_logs, :application_id, :integer, null: false
  end

  def down
    remove_column :request_logs, :application_id
  end
end
