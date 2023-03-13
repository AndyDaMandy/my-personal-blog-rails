class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 100 }
  validates :description, presence: true, length:  {minimum: 4, maximum: 100}
  validates :content, presence: true, length: { minimum: 10 }
  belongs_to :user
  #has_many :comments, dependent: :destroy

  has_rich_text :content
  has_many_attached :images
  has_one :content_inside, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
end
