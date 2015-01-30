class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:venue, {:presence => true})
  before_save(:capitalize_venue)

private
  define_method(:capitalize_venue) do
    self.venue=(venue().capitalize())
  end
end
