require 'rails_helper'

RSpec.describe 'Post Page Show', type: :feature do
  before :each do
    @user = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      posts_counter: 3
    )
    @post = Post.create(title: 'Hello',
                        text: 'Reviewer, please approve this PR',
                        comments_counter: 0,
                        likes_counter: 0,
                        author_id: @user.id)
    5.times do
      Comment.create(post: @post,
                     author: @user,
                     text: 'hello @reviewer, kindly approve',
                     post_id: @post.id,
                     author_id: @user.id)
    end
    visit user_post_path(@user.id, @post.id)
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the writer of the post' do
    expect(page).to have_content("by #{@user.name}")
  end

  it 'shows how many likes it has' do
    expect(page.body).to have_content(@post.likes_counter.to_s)
  end

  it 'shows how many comments it has' do
    expect(page.body).to have_content(@post.comments_counter.to_s)
  end

  it 'shows the body of the post' do
    expect(page).to have_content('Reviewer, please approve this PR')
  end

  it 'shows the username of each commentor' do
    expect(page).to have_content(@user.name)
  end

  it 'shows comment of each commentor' do
    expect(page).to have_content('hello @reviewer, kindly approve')
  end
end
