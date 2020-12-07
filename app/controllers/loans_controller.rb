class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
    @books = Book.all
    @users = User.all
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    @books_availables = Book.all.select { |book| book.loans? }
    @users_availables = User.all.select { |user| user.valid_amount_of_loans? }
    @book_edit_list = @books_availables.map { |book| [book.title, book.id] }
    if @book_edit_list.empty?
      redirect_to root_path, notice: 'No hay libros disponibles'
    else
      @user_edit_list = @users_availables.map { |user| [user.email, user.id] }
    end
  end
 
  # GET /loans/1/edit
  def edit
    if current_user.authorized?
      @users_availables = User.all.select { |user| user.valid_amount_of_loans? }
      @user_list = @users_availables.map { |user| [user.email, user.id] }
      @user_loan = Loan.find(params[:id])

      unless @user_list.include? @user_loan
        @user_edit_list = @user_list.unshift([@user_loan.user.email, @user_loan.user_id]).uniq
      end

      @books_availables = Book.all.select { |book| book.loans? }
      @book_list = @books_availables.map { |book| [book.title, book.id] }
      @book_loan = Loan.find(params[:id])
      @book_edit_list = @book_list.unshift([@book_loan.book.title, @book_loan.book_id])
    else  
      redirect_to root_path, notice: 'No estas autorizado'
    end
  end


  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(:user_id, :book_id, :book_title, :user_email, :loan_start, :loan_finish, :state)
    end


end
