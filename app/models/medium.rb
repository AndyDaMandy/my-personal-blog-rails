class Medium < ApplicationRecord
  has_one_attached :thumbnail
  has_rich_text :thoughts
  belongs_to :user

  enum type: %i[book movie tv game website video podcast music]
  enum platform: %i[streaming dvd blu-ray switch xbox playstation pc 3ds website youtube]
  enum progress: %i[not_started in_progress finished]

  validates :name, presence: true
  validates :release_date, presence: true
  validates :type, presence: true
  validates :platform, presence: true

end
