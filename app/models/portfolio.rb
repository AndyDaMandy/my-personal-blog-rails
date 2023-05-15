# frozen_string_literal: true

# Portfolio
class Portfolio < ApplicationRecord
  belongs_to :user
  has_one_attached :poster
end
