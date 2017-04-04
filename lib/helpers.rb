module SiteHelpers

  def results_by_year
    dato.results.reverse.group_by { |r| r.date.year }
  end

  def ordered_trail_segments
    dato.trails.sort_by { |t| t.order }
  end

# TAKEN FROM RAILS API DOCS
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

# TAKEN FROM RAILS API DOCS
  def link_to_if(condition, name, options = {}, html_options = {}, &block)
    link_to_unless !condition, name, options, html_options, &block
  end

end
