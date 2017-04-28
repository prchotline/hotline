class Address < ApplicationRecord
  # before_save :reformat_phone

  belongs_to :location, required: false
  belongs_to :county



  validates :address, :county, presence: true


  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :for_zipcode, -> (zip) { where("zipcode=?", zip ) }
  scope :by_zipcode, -> { order('zipcode') }
  scope :for_county, -> (id) { where('county_id=?', id) }


  scope :by_name, -> { joins(:location).order('locations.name')}
  scope :by_verified, -> { joins(:location).order('locations.updated_at')}

  scope :by_county, -> { order('county_id') }
  scope :by_city, -> { order('city') }
  scope :by_active, -> {order('active DESC')}






  geocoded_by :full_address
  # after_validation :geocode
  # after_validation :geocode
  def require_one_address
    puts location.addresses.count > 1
    return location.addresses.count > 1

  end
  def full_address
    address = "#{self.address}, #{self.city}, PA #{self.zipcode}"
    return address
  end

  def street_address
    return "#{self.address}"
  end

  def extra_details
    return "#{self.city}, PA #{self.zipcode}"
  end

end
