class Pet < ApplicationRecord
  belongs_to :shelter, optional: true

  validates_presence_of :name

  def self.pet_count
    self.count
  end
end
