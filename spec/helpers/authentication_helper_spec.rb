# frozen_string_literal: true

require "rails_helper"

# Specs in this file have access to a helper object that includes
# the AuthenticationHelper. For example:
#
# describe AuthenticationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe(AuthenticationHelper, type: :helper) do
  describe "#auth0_login_path" do
    it "returns the login path for auth0" do
      expect(helper.auth0_login_path).to(eq("/auth/auth0"))
    end
  end
end
