class FlightTable < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => :flights_count

  # Indirect associations

  # Validations

  validates :description, :presence => true

end
