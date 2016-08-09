class Snippet < ApplicationRecord
  validates :title, presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

end
