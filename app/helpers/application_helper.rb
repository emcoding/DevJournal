module ApplicationHelper

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(
      filter_html: true,
      safe_links_only: true,
      hard_wrap: true
    )
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true
    }

    markdown = Redcarpet::Markdown.new(renderer, options )
    markdown.render(text)
        # or should I do: markdown.render(text || '')
  end
end
