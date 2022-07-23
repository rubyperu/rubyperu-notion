class Workspace < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :documents, dependent: :destroy
end
