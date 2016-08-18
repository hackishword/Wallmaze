class AddNotifiedByToNotification < ActiveRecord::Migration
  def change
    change_table :notifications do |t|
      t.rename :notified_id, :notified_by_id
    end
  end
end
