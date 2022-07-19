class PersonalBooksController < ApplicationController
  before_action :set_personal_book, only: %i[ show edit update destroy ]

  # GET /personal_books or /personal_books.json
  def index
    @personal_books = PersonalBook.all
  end

  # GET /personal_books/1 or /personal_books/1.json
  def show
  end

  # GET /personal_books/new
  def new
    @personal_book = PersonalBook.new
  end

  # GET /personal_books/1/edit
  def edit
  end

  # POST /personal_books or /personal_books.json
  def create
    @personal_book = PersonalBook.new(personal_book_params)

    respond_to do |format|
      if @personal_book.save
        format.html { redirect_to personal_book_url(@personal_book), notice: "Personal book was successfully created." }
        format.json { render :show, status: :created, location: @personal_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_books/1 or /personal_books/1.json
  def update
    respond_to do |format|
      if @personal_book.update(personal_book_params)
        format.html { redirect_to personal_book_url(@personal_book), notice: "Personal book was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_books/1 or /personal_books/1.json
  def destroy
    @personal_book.destroy

    respond_to do |format|
      format.html { redirect_to personal_books_url, notice: "Personal book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_book
      @personal_book = PersonalBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_book_params
      params.fetch(:personal_book, {})
    end
end
