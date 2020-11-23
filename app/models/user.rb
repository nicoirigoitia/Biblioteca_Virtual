class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
    has_many :loans, dependent: :destroy
    has_many :books, through: :loans

  def is_biblio?
    self.role == 'bibliotecario'
  end

  def authorized?
    self.is_biblio? || self.admin? 
  end
end
