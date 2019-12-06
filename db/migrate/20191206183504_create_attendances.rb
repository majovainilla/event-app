class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances, id: false do |t|
      t.references :attendee, foreign_key: { to_table: :users }
      t.references :attended_event, foreign_key: { to_table: :events }
      t.timestamps
    end
  end
end
