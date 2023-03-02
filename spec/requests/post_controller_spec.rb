require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'get index for posts' do
    before(:example) { get('/users/1/posts') }
    it 'should display the correct placeholder' do
      expect(response.body).to include 'Here is a list of all posts for a given user'
    end

    it 'should have a status response of 200' do
      expect(response).to have_http_status(200)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  context 'Get #show for posts' do
    before(:example) { get('/users/1/posts/1') }
    it 'should have a status response of 200' do
      expect(response).to have_http_status(200)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should display the correct placeholder' do
      expect(response.body).to include 'This is the details for a particular post of a given user'
    end
  end
end
