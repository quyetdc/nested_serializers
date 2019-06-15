class AuthorsController < ApplicationController
   before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  def index
    @authors = Author.includes(books: :details).all
    # @authors = Author.includes(books: :pages).all

    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:name, :email,
                                      books_attributes: [:id, :title, :author_id, :_destroy,
                                      pages_attributes: %i[id number book_id _destroy]])
    end
end
