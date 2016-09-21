class Snippet < ApplicationRecord
  validates :title, presence: true
  belongs_to :account

  acts_as_taggable_on :tags # tagging gem
  acts_as_taggable_on :projects

  mount_uploader :image, ImageUploader # carrierwave gem

  def self.search(search)
    q_words = Snippet.where("title ILIKE ? OR content ILIKE ?", "%#{search}%", "%#{search}%")
    # q_tags = Snippet.tagged_with(tag: "#{search}")
    # q_words + q_tags
  end

end
