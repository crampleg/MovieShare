class AddMovienameToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :moviename, :string
  end
end
