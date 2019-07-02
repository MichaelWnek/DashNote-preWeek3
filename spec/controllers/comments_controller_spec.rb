require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @post = Post.create(title: 'Post', body: 'This is the body', author: @user)
  end

  it 'should create a comment' do
    new_comment = { body: 'This is the body' }
    expect {
      post :create, format: 'js', xhr: true, post_id: @post.id, comment: new_comment
    }.to change(Comment, :count).by 1
  end

  it 'should destroy a comment' do
    comment = Comment.create(body: 'This is the body', post: @post, author: @user)
    expect {
      delete :destroy, xhr: true, format: 'js', id: comment, post_id: @post
    }.to change(Comment, :count).by -1
  end
end
