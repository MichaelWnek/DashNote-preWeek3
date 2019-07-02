module PostsHelper
  def render_posts
    if @posts.present?
      render @posts
    else
      'There are no posts... yet!'
    end
  end
end
