class RecommendedBooksController < ApplicationController
	before_action :logged_in_user, only: [:user_recommendation]
	before_action :logged_in_admin, only: [:edit, :destroy, :index]

	def index
		@recommended_books = RecommendedBook.page(params[:page]).per(20)
	end

	def new
		@recommended_book = RecommendedBook.new
	end

	def create
		if current_user.recommended_books.create(recommended_book_params)
			redirect_to current_user
		else 
			flash.now[:error] = "Error occured while adding book to recommendation"
			render 'new'
		end
	end

	def show
		@recommended_book = RecommendedBook.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		redirect_to root_url
	end

	def edit
		@recommended_book = RecommendedBook.find(params[:id])
	end

	def update
		@recommended_book = RecommendedBook.find(params[:id])
		@recommended_book.status = "Accepted"
		if @recommended_book.update_attributes(recommended_book_params)
			book = Book.new(isbn: @recommended_book.isbn, title: @recommended_book.title, 
				author: @recommended_book.author, description: @recommended_book.description)
			if book.save
				flash.now[:success] = "Successfully added book to library"
			    redirect_to recommended_books_path
			 else
			 	flash.now[:error] = book.errors.full_messages.to_sentence
			 	render 'edit'
			 end
		else
			render 'edit'
		end
	end

	def destroy
		@recommended_book = RecommendedBook.find(params[:id])
		@recommended_book.status = "Declined"
		if @recommended_book.save
			flash.now[:success] = "Successfully declined book recommendation"
		else
			flash.now[:error] = "Error occured while declining book recommendation"
		end
		redirect_to recommended_books_path
	end

	def user_recommendation
		@recommended_books = current_user.recommended_books.page(params[:page]).per(20)
	end

	private
	def recommended_book_params
		params.require(:recommended_book).permit(:isbn, :title, :description, :author, :status)
	end
end
