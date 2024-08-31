# frozen_string_literal: true

# User class model using devise
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :username, presence: true, length: { maximum: 20 }
  has_many :posts, dependent: :destroy
  has_many :artworks, dependent: :destroy
  has_many :media, dependent: :destroy

  enum role: %i[user moderator admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :user
  end
end
