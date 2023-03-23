class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 1, maximum: 250 }
  validates :description, presence: true, length:  {minimum: 1, maximum: 250 }
  validates :content, presence: true, length: { minimum: 10 }
  belongs_to :user
  has_many :comments, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id? #will change the slug if the name changed
    title_changed?
  end

  has_rich_text :content
  has_many_attached :images
  has_one :content_inside, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
end
