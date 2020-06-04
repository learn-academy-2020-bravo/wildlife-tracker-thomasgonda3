class Animal < ApplicationRecord
  has_many :sightings
  validates :common_name, presence: true
  validates :latin_name, presence: true
  validates :common_name, uniqueness: true
  validates :latin_name, uniqueness: true
  validate :common_latin

  def common_latin
    if self.common_name == self.latin_name
      errors.add(:base, "Common name must be different than latin name")
    end
  end
end
