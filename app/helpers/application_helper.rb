module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  # helper_method :resource_name, :resource, :devise_mapping

  # for devise forms
  def resource_name
    :account
  end

  def resource
    @resource ||= Account.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:account]
  end

  #  Redcarpet markdown
  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    renderer = HTML.new(
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
