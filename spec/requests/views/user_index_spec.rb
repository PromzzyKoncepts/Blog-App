require 'rails_helper'

RSpec.describe 'Render the page', type: :feature do
  before(:all) do
    @first_user = User.create(name: 'Promise Okechukwu',
                              photo: 'https://avatars.githubusercontent.com/u/101924220?v=4', bio: 'sample for test')

    # post1 = Post.create(title: 'Rspec test', text: 'sample text for bio', author_id: @first_user)

    it 'shows the username of all users' do
      visit users_path
      expect(page).to have_content(@first_user.name)
    end
  end
end
