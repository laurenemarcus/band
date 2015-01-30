class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:venue, {:presence => true})
end
