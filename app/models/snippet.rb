class Snippet < ApplicationRecord

  scope :last_touched, -> { order("updated_at DESC") }

  belongs_to :account
  validates :title, presence: true

  acts_as_taggable_on :tags # tagging gem
  acts_as_taggable_on :projects

  mount_uploader :image, ImageUploader # carrierwave gem

  def self.search(search)
    q_words = Snippet.where("title ILIKE ? OR content ILIKE ?", "%#{search}%", "%#{search}%")
    q_tags = Snippet.tagged_with(search)  # => both tags and project-tags
    q_words + q_tags
  end

end
