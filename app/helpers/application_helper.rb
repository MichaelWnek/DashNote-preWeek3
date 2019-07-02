module ApplicationHelper
  def flash_message
    flash_path = 'layouts/flashes'
    if flash[:notice]
      render "#{flash_path}/notice"
    elsif flash[:danger]
      render "#{flash_path}/danger"
    elsif flash[:alert]
      render "#{flash_path}/alert"
    end
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
