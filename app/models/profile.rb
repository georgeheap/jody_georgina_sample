class Profile < ApplicationRecord
  belongs_to :customer
  belongs_to :default_avatar, required: false

  has_many :avatars
  accepts_nested_attributes_for :avatars
end
