class User < ApplicationRecord
  include Gravtastic
  gravtastic secure: true, size: 50, default: "identicon"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  has_and_belongs_to_many :friends,
    class_name: 'User',
    foreign_key: 'this_user_id',
    association_foreign_key: 'other_user_id'

  has_many :likes
  has_many :posts
  has_many :comments

  def posts
    @posts = Post.where(author_id: self.id)
  end

  def is_friend
    @friends = self.friends
    return true if @friends.includes(current_user)
    return false
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end
end
