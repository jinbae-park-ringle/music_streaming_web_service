class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_musics, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups

  has_many :group_musics, dependent: :destroy

  def has_music_love?(music)
    self.likes.find_by(music: music).present?
  end

  def has_group?
    self&.groups&.any?
  end
end
