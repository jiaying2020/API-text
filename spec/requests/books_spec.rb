require 'rails_helper'

describe 'Books API', type: :request do
  describe " GET /books" do  
    it 'returns all books' do
      FactoryBot.create(:book, title: 'AAA', author: 'AAA')
      # FactoryBot.create(:book, title: 'The Catcher in the Rye', author: 'J. D. Salinger')

     get '/api/v1/books'
      expect(response).to have_http_status(:success) 
      expect(JSON.parse(response.body).size).to eq(2)
    
    end
  end
    
  describe 'POST /books' do
    it 'create a new book' do
      expect{  
        post '/api/v1/books', params: { book: {title:'BBB', author:'BBB'}  }
      }.to change { Book.count }.from(0).to(1)
        expect(response).to have_http_status(:created)  
    end 
  end

  describe 'DELETE /books/:id' do
    let!(:book){FactoryBot.create(:book, title: 'CCC', author: 'CCC')}

    it 'deletes a book' do
      expect{
      delete "/api/v1/books/#{book.id}" 
      }.to change { Book.count }.from(1).to(0)
        
        expect(response).to have_http_status(:no_content)  
    end 
  end

end
