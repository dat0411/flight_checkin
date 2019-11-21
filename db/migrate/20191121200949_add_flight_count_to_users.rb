class AddFlightCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :flights_count, :integer
  end
end
