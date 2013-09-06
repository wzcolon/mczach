class AddApplicationsTable < ActiveRecord::Migration
  def up
    create_table :applications, force: true do |t|
      t.string :name, null: false

      t.timestamps
    end
  end

  def down
    drop_table :applications
  end
end
