class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  def show
    @comments = @post.comments
    @new_comment = Comment.new
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post

    if @post.save
      flash[:notice] = 'Post was created.'
      redirect_to @post
    else
      flash[:error] = 'Error while creating post. Please try again.'
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = 'Post was updated.'
      redirect_to @post
    else
      flash[:error] = 'There was an error saving the post. Please try again.'
      render :edit
    end
  end

  def destroy
    authorize @post

    if @post.destroy
      flash[:notice] = 'Post was deleted.'
      redirect_to posts_path
    else
      flash[:error] = 'There was an error deleting the post. Please try again.'
      render @post
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body).merge(author: current_user)
  end
end
