class RemoveApplicationNameFromRequestLogs < ActiveRecord::Migration
  def up
    remove_column :request_logs, :application_name
  end

  def down
    add_column :request_logs, :application_name, :string, null: false
  end
end
