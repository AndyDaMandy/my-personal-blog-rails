# frozen_string_literal: true

# Link model
class Link < ApplicationRecord
  belongs_to :user

  validates :url_name, presence: true
  validates :url, presence: true
  # validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }, if: -> { url.present? }


end
