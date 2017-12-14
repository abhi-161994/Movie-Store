class Movie < ApplicationRecord
  mount_uploader :image,MovieUploader
  validates_presence_of :title,:genre,:plot,:rating,:web,:year,:cast
  validates :rating, numericality: {less_than_or_equal_to: 10}
end
