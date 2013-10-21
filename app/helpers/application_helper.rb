module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def resource
    User.new
  end

  def resource_name
    :user
  end

  def devise_mapping
    Devise.mappings[:user]
  end

  def resource_class
    devise_mapping.to
  end

  def comment_url_helper(comment)
    card = comment.card
    [card, comment]
  end
end
