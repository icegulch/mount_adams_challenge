module SiteHelpers


  def results_by_year
    dato.results.group_by { |r| r.run_date.year }.sort.reverse
  end

  def markdownify(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text)
  end

  def link_to_unless(condition, name, options = {}, html_options = {}, &block)
    if condition
      if block_given?
        block.arity <= 1 ? capture(name, &block) : capture(name, options, html_options, &block)
      else
        name
      end
    else
      link_to(name, options, html_options)
    end
  end

  def link_to_if(condition, name, options = {}, html_options = {}, &block)
    link_to_unless !condition, name, options, html_options, &block
  end

  def nav_link(title, path, options = {})
    options[:class] = (options[:class] or '').split(' ')
    options[:class] << 'active' if current_page?(path)
    options[:class] = options[:class].join(' ')

    if current_page?(path)
      link = content_tag(:span, title, options)
    else
      link = link_to(title, path, options)
    end
  end

  def current_page?(path)
    current_page.url.chomp('/') == path.chomp('/')
  end

end
