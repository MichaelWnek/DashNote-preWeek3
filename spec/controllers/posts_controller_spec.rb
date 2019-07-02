require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @new_post = Post.create(title: 'Post', body: 'This is the body', author: @user)
  end

  it 'should get index' do
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'should show a requested post' do
    get :show, id: @new_post.id
    expect(response).to have_http_status(:success)
  end

  it 'should get new' do
    get :new
    expect(response).to have_http_status(:success)
  end

  it 'should create a new post' do
    new_post = { title: 'Post', body: 'This is the body' }
    expect {
      post :create, post: new_post
    }.to change(Post, :count).by 1
  end

  it 'should get edit' do
    get :edit, id: @new_post.id
    expect(response).to have_http_status(:success)
  end

  it 'should update a post' do
    get :update, id: @new_post.id, post: { title: 'New Title', body: 'New body' }
    @new_post.reload

    expect(@new_post.title).to eq('New Title')
    expect(@new_post.body).to eq('New body')
  end

  it 'should delete a post' do
    expect {
      delete :destroy, id: @new_post.id
    }.to change(Post, :count).by -1
  end
end
