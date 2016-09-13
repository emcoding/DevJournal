class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable
  # , :validatable remove module, to be able to skip validations on creating a guest account


  validates_presence_of   :email
  validates_uniqueness_of :email
  # validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of     :password
  validates_confirmation_of :password

  has_many :snippets

  def self.new_guest
    new { |a| a.guest = true }
  end
end
