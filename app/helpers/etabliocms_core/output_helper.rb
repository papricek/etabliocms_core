module EtabliocmsCore::OutputHelper

  def html_out(string = "", options = {})
    string = RedCloth.new(string.to_s)
    string = string.to_html(:textile, :tags)
    string = truncate_and_strip_tags(string, options[:words].to_i) if options[:words]
    string = string.gsub(/\\|"/) { |c| "\\#{c}" } if options[:escape_double_quote]
    string.html_safe
  end

  def sanitized(string)
    simple_format(auto_link(h(string)))
  end

  def truncate_words(text, wordcount = 30, separator = "&hellip;")
    text.to_s.split[0..(wordcount-1)].join(" ") +(text.to_s.split.size > wordcount ? separator : "")
  end

  def truncate_and_strip_tags(text, wordcount = 30, separator = "&hellip;")
    truncate_words(strip_tags(text.to_s), wordcount, separator)
  end

  def truncate_and_strip_tags_from_textile(textile, wordcount = 30, separator = "&hellip;")
    truncate_words(strip_tags(RedCloth.new(textile.to_s).to_html), wordcount, separator)
  end

  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

end
