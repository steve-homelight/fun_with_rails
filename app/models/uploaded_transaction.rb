class UploadedTransaction < ApplicationRecord
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, length: { minimum: 5 }
  validates :listing_price, presence: true
  validates :selling_price, presence: true
  validates :listing_date, presence: true
  validates :selling_date, presence: true

  belongs_to :listing_agent, required: false, class_name: "Agent"
  belongs_to :selling_agent, required: false, class_name: "Agent"

  scope :single_family_homes, -> { where(property_type: "single_family_home") }
  scope :sold, -> { where(status: "sold") }


  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end
end
