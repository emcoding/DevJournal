class Snippet < ApplicationRecord
  validates :title, presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
    #where("content LIKE ? OR name LIKE ?", "%#{search}%")
  end

end
