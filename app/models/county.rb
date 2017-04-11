class County < ApplicationRecord

  before_save :reformat_county_name

  # Relationships
  has_many :item_counties
  has_many :items, through: :item_counties
  has_many :addresses

  # Validations
  validates_presence_of :name

  # Scopes
  scope :alphabetical, -> { order('name') }
  scope :for_name, -> (name) { where('name=?',name) }

  private

  def reformat_county_name
    name = self.name.capitalize
    self.name = name
  end

end
