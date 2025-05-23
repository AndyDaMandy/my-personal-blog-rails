# frozen_string_literal: true

# Artwork model
class Artwork < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :image, presence: true
end
