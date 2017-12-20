class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :comments, dependent: :destroy
         has_many :mmovies, through: :comments
  validates_presence_of :name
  mount_uploader :image,UserUploader
end
