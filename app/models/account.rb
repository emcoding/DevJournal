class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :snippets

  ROLES = [:admin, :snipper, :guest]  # see cancancan wiki if more complex role system is needed

end
