require 'rails_helper'

RSpec.describe 'Category requests' do
    describe 'GET /category' do
        it 'returns a category' do
            get('/category')
            json = JSON.parse(response.body)
            expect(json['category']).to eql('ok')
        end
    end
ende