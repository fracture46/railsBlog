class Post < ActiveRecord::Base

  validates :titre, presence: true
  validates :chapeau, presence: true
  validates :corps, presence: true
  validates :date_publication, presence: true

  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader

  def author
    "#{user.first_name.capitalize} #{user.last_name.upcase}"
  end
end
