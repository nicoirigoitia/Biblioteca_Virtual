class AddStateToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :state, :string
    add_column :loans, :loan_start, :date
    add_column :loans, :loan_finish, :date
  end
end
