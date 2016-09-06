class Snippet < ApplicationRecord
  validates :title, presence: true
  belongs_to :account

  acts_as_taggable_on :tags # tagging gem

  mount_uploader :image, ImageUploader # carrierwave gem

  def self.search(search)
    where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%")
  end

end
