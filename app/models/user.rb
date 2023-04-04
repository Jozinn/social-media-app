class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :friends,
    class_name: 'User',
    foreign_key: 'this_user_id',
    association_foreign_key: 'other_user_id'
    
  has_many :likes
  has_many :posts
  has_many :comments
end
