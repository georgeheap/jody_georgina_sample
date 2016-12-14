class Avatar < ApplicationRecord
  # Going through accepts_nested_attributes_for, it hoses unless
  # we say required false
  belongs_to :profile, required: false

  mount_uploader :avatar, AvatarUploader
end
