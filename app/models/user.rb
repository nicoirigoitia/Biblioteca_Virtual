class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :friends
         has_many :loans, dependent: :destroy
         has_many :books, through: :loans

         @skip = false

         def skip_notifications!()
           skip_confirmation_notification!
           @skip = true
         end
       
         def email_changed?
           return false if @skip
           super
         end
       
         def encrypted_password_changed?
           return false if @skip
           super
         end    
end
