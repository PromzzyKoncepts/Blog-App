require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe "GET #index" do
    let(:user) { FactoryBot.create(:user) }
    let!(:post_1) { FactoryBot.create(:post, author_id: user.id) }
    let!(:post_2) { FactoryBot.create(:post, author_id: user.id) }

    context 'when the user and the post exist' do
      before { get "/users/#{user.id}" }

      it "assigns the user and posts variables" do
        expect(assigns(:user)).to eq(user)
        expect(assigns(:posts)).to eq([post_1, post_2])
      end

      it "returns a status response of 200" do
        expect(response).to have_http_status(:ok)
      end
    end
  end


 describe 'Get #show' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post, author_id: user.id) }

    context 'when the user and the post exist' do
      before { get "/users/#{user.id}/posts/#{post.id}" }

      it 'assigns the user, posts and post variables' do
        expect(assigns(:user)).to eq(user)
        expect(assigns(:posts)).to eq([post])
        expect(assigns(:post)).to eq(post)
      end

      it 'returns a status response of 200' do
        expect(response).to have_http_status(200)
      end

      it 'assigns the current_user variable' do
        expect(assigns(:current_user)).to_not be_nil
      end
    end

    context 'when the user does not exist' do
      it 'raises an ActiveRecord::RecordNotFound error' do
        expect { get "/users/999/posts/#{post.id}" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when the post does not exist' do
      it 'raises an ActiveRecord::RecordNotFound error' do
        expect { get "/users/#{user.id}/posts/999" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
