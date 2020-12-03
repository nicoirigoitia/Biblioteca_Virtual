class Loan < ApplicationRecord
    belongs_to :book
    belongs_to :user

    validates :user_id, :book_id, :loan_start, :state, presence: true


end
