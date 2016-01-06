module Markdowner
  def markdown_to_html(markdown_content)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      prettify: true
    }
    extensions = {
      autolink:           true,
      superscript:        true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(markdown_content)
  end
end