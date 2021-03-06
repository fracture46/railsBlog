class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :comments
  
  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end
end
