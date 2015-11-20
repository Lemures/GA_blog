class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :username, use: :slugged

  validates :username, presence: true , uniqueness: true

  validates :email, presence: true , uniqueness: true

  validates :firstName, presence: true

  validates :lastName, presence: true

  has_many :posts

  has_many :comments, through: :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
