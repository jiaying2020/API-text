module Api 
  module V1
    class BooksController < ApplicationController
            
      def index
        render json: Book.all 
      end

      def cerate 
        book = Book.new (book_params)
        if nook.save
            render json: book, status: :created
        else
            render book.errors, status: :unprocessable_entity
            end
      end

      def destroy 
        Book.find(params[id]).destroy!
        head :no_content        
      end

      private
        def book_params
            params.require(:book).permit(:title,:author)
        end
      end
    end 
end 
