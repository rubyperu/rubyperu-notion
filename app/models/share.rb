class Share < ApplicationRecord
  belongs_to :user
  belongs_to :shareable, polymorphic: true
end
