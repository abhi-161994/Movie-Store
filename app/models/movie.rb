class Movie < ApplicationRecord
  mount_uploader :image,MovieUploader
  has_many :comments
  has_many :users,through: :coments
   validates_presence_of :title,:genre,:plot,:rating,:web,:year,:cast
   validates :rating, numericality: {less_than_or_equal_to: 10}

  def self.search(search)
    where("title LIKE?","%#{search}%")
end
end
