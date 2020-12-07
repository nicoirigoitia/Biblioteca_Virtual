class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
    has_many :loans, dependent: :destroy
    has_many :books, through: :loans

    validates_length_of :loans, maximum: 2, :on => :create
    validates_length_of :loans, maximum: 3, :on => :update


    def is_biblio?
      self.role == 'bibliotecario'
    end

    def authorized?
      self.is_biblio? || self.admin? 
    end

    def valid_amount_of_loans?
      self.loans.count < 3
    end

end
