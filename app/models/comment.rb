class Comment < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :user
  belongs_to :post

  def author
    "#{user.first_name.capitalize} #{user.last_name.upcase}"
  end
end
