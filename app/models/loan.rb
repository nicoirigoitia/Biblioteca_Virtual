class Loan < ApplicationRecord
    belongs_to :book
    belongs_to :user

    validates :user_id, :book_id, :loan_start, :state, presence: true
    validates_associated :user

    before_validation do
        self.loan_start = Date.today if loan_start.blank?
    end
    
  
end
