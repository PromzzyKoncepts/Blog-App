require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    let!(:user1) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user) }

    before { get :index }

    it 'renders the :index template' do
      expect(response).to render_template(:index)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    # it 'assigns @users' do
    #   expect(assigns(:users)).to match_array([user1, user2])
    # end
  end

  describe 'GET #show' do
    let!(:user) { FactoryBot.create(:user_with_posts) }

    before { get :show, params: { id: user.id } }

    it 'renders the :show template' do
      expect(response).to render_template(:show)
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'assigns @posts' do
      expect(assigns(:posts)).to eq(user.posts)
    end

    context 'when the user does not exist' do
      it 'raises an ActiveRecord::RecordNotFound error' do
        expect do
          get :show, params: { id: 9999 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    it 'displays no posts for a user with no posts' do
      user = FactoryBot.create(:user)

      get :show, params: { id: user.id }

      expect(assigns[:user].posts).to be_empty
      expect(assigns[:posts]).to be_empty
    end

    it 'displays a list of posts belonging to the user' do
      user = FactoryBot.create(:user_with_posts)

      get :show, params: { id: user.id }

      expect(assigns[:user].posts).not_to be_empty
      expect(assigns[:posts]).to match_array(user.posts)
    end

    it 'returns a 404 status code when user is not found' do
      expect do
        get :show, params: { id: 'a bogus id' }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
