class PersonalAuthorsController < ApplicationController
  before_action :set_personal_author, only: %i[ show edit update destroy ]

  # GET /personal_authors or /personal_authors.json
  def index
    @personal_authors = PersonalAuthor.all
  end

  # GET /personal_authors/1 or /personal_authors/1.json
  def show
  end

  # GET /personal_authors/new
  def new
    @personal_author = PersonalAuthor.new
  end

  # GET /personal_authors/1/edit
  def edit
  end

  # POST /personal_authors or /personal_authors.json
  def create
    @personal_author = PersonalAuthor.new(personal_author_params)

    respond_to do |format|
      if @personal_author.save
        format.html { redirect_to personal_author_url(@personal_author), notice: "Personal author was successfully created." }
        format.json { render :show, status: :created, location: @personal_author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_authors/1 or /personal_authors/1.json
  def update
    respond_to do |format|
      if @personal_author.update(personal_author_params)
        format.html { redirect_to personal_author_url(@personal_author), notice: "Personal author was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_authors/1 or /personal_authors/1.json
  def destroy
    @personal_author.destroy

    respond_to do |format|
      format.html { redirect_to personal_authors_url, notice: "Personal author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_author
      @personal_author = PersonalAuthor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_author_params
      params.fetch(:personal_author, {})
    end
end
