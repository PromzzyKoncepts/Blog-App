require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  context 'get index for users' do
    before(:example) { get users_path }
    it 'should display the correct placeholder' do
      expect(response.body).to include 'This page lists all the registered user'
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should have a status response of 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'Get #show for user' do
    before(:example) { get('/users/1') }

    it 'should have a status response of 200' do
      expect(response).to have_http_status(200)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    
    it 'should display the correct placeholder' do
      expect(response.body).to include 'This page shows the page for a given logged in user'
    end
  end
end