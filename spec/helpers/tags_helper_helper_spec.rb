require 'rails_helper'

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
RSpec.describe TagsHelper, type: :helper do
  describe '#icon_link_to' do
    it "returns a link prepended by an icon" do
      expect(helper.icon_link_to("TagsHelperTest", '/test', '🧪', {class: 'testing'})).to eq(
        "<a class=\"testing\" href=\"/test\"><span class=\"icon\" data-icon=\"🧪\"></span><span>TagsHelperTest</span></a>"
      )
    end
  end
end
