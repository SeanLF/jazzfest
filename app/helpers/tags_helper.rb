module TagsHelper
  # Creates a link with a prepended icon
  # @returns [String]
  def icon_link_to(text, path, icon, options)
    link_to(path, options) do
      icon_tag(icon) << content_tag(:span, text)
    end
  end

  # Creates a span tag with an icon
  def icon_tag(icon, text='')
    content_tag(:span, text, {class: 'icon', 'data-icon': icon})
  end
end