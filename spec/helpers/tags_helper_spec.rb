# frozen_string_literal: true

require "rails_helper"

# Specs in this file have access to a helper object that includes
# the TagsHelperHelper. For example:
#
# describe TagsHelperHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe(TagsHelper, type: :helper) do
  describe "#icon_link_to" do
    link_text = "TagsHelperTest"
    link = "/test"
    icon = "🧪"
    link_options = { class: "link-testing" }
    icon_options = { class: "icon-testing" }

    it "returns a link prepended by an icon with classes on link and icon spans" do
      expect(helper.icon_link_to(link_text, link, icon, link_options, icon_options)).to(eq(
        "<a class=\"#{link_options[:class]}\" href=\"#{link}\"><span class=\"#{icon_options[:class]}\" data-icon=\"#{icon}\"></span><span>#{link_text}</span></a>"
      ))
    end

    it "returns a link with no text and an icon" do
      expect(helper.icon_link_to("", link, icon, link_options, icon_options)).to(eq(
        "<a class=\"#{link_options[:class]}\" href=\"#{link}\"><span class=\"#{icon_options[:class]}\" data-icon=\"#{icon}\"></span></a>"
      ))
    end
  end
end
