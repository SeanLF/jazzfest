module TagsHelper
  # Creates a link with a prepended icon
  # @returns [String]
  def icon_link_to(text, path, icon, link_options={}, icon_options={})
    link_to(path, link_options) do
      to_add = icon_tag(icon, icon_options)
      to_add << content_tag(:span, text) unless text.empty?
      to_add
    end
  end

  # Creates a span tag with an icon
  # returns [String]
  def icon_tag(icon, icon_options={})
    text = ''
    options = {class: 'icon', 'data-icon': icon}
    content_tag(:span, text, options.merge(icon_options))
  end
end