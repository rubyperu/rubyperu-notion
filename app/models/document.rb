class Document < ApplicationRecord
  belongs_to :workspace
  belongs_to :owner
  has_rich_text :content
end
