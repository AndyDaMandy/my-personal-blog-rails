# frozen_string_literal: true

# Model for comments
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 1, maximum: 255 }
end
