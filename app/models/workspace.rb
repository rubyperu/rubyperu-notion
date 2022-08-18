class Workspace < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :documents, dependent: :destroy
  has_many :shares, as: :shareable
  has_many :users, through: :shares

  def give_access(user)
    shares.create(user: user)
  end
end
