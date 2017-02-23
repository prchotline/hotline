class Item < ApplicationRecord
  
  # Relationships
  has_many :counties, through: :item_counties
  has_many :locations, through: :item_locations

  # Validations
  validates_presence_of :name

  # Scopes
  scope :alphabetical, -> { order('name') }
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }

end