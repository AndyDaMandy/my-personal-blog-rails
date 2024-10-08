# frozen_string_literal: true

# Post model for generating blog posts
class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :description, presence: true, length: {minimum: 1, maximum: 250 }
  validates :content, presence: true, length: { minimum: 10 }
  belongs_to :user

  extend FriendlyId
  friendly_id :title, use: :slugged

  # will change the slug in moment the name changed
  def should_generate_new_friendly_id?
    title_changed?
  end

  has_rich_text :content
  has_many_attached :images
  has_one :content_inside, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

  scope :find_title, ->(title) { where("lower(title) ILIKE ?", '%' + title.downcase + '%') }
end
