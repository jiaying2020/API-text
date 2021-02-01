require 'rails_helper'

describe 'Books API', type: :request do
    describe 'GET /books' do
      it 'returns all books' do

         FactoryBot.create(:book, title: '1984', author: 'George Orwell')
         FactoryBot.create(:book, title: 'The Catcher in the Rye', author: 'J. D. Salinger')

         get '/api/v1/books'
    
         expect(response).to have_http_status(:success) 
         expect(JSON.parse(response.body).size).to eq(2)
      end
    end
    
    describe 'POST /books' do
      it 'create a new book' do .

        post '/api/v1/books', params: { book: {title:'The Hunger Games', author:'Suzanne Collins'}  }
        
        expect(response).to have_http_status(:created)  
      end 
    end
    

end
