class AddListnameToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :listname, :string
  end
end
