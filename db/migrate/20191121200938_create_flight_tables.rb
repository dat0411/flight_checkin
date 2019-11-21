class CreateFlightTables < ActiveRecord::Migration[5.1]
  def change
    create_table :flight_tables do |t|
      t.string :description
      t.datetime :time
      t.integer :user_id

      t.timestamps
    end
  end
end
