class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :workspaces, dependent: :destroy, foreign_key: :owner_id

  after_create :create_default_workspace

  private

  def create_default_workspace
    self.workspaces.create(title: "Personal")
  end
end
