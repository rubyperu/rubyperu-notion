class Document < ApplicationRecord
  belongs_to :workspace
  belongs_to :owner, class_name: 'User'
  has_rich_text :content
end
