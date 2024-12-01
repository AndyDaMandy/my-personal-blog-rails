class Medium < ApplicationRecord
  has_one_attached :thumbnail
  has_rich_text :thoughts
  belongs_to :user

  enum category: %i[n/a other book movie tv game website video podcast music], _prefix: :media_type
  enum platform: %i[n/a other physical streaming dvd blu-ray switch xbox playstation pc 3ds website youtube], _prefix: :media_platform
  enum progress: %i[n/a other not_started in_progress finished], _prefix: :media_progress

  validates :name, presence: true
  validates :release_date, presence: true
  validates :type, presence: true
  validates :platform, presence: true

end
