# frozen_string_literal: true

require "rails_helper"

describe UserPolicy do
  subject { described_class.new(current_user, user) }

  let(:user) { User.new }

  context "being a visitor" do
    let(:current_user) { Auth0::AuthenticationConcern::CurrentUser.new(nil) }
    let(:resolved_scope) do
      described_class::Scope.new(current_user, User.all).resolve
    end

    it { is_expected.to(forbid_actions([:index, :new, :create, :show, :edit, :update, :destroy])) }

    it "excludes users from resolved scope" do
      expect(resolved_scope).not_to(include(user))
    end
  end

  context "being an applicant" do
    let(:user) { User.create(auth0_id: "1") }
    let(:current_user) { Auth0::AuthenticationConcern::CurrentUser.new({ "uid" => "1", "roles" => ["Applicant"] }) }
    let(:resolved_scope) do
      described_class::Scope.new(current_user, User.all).resolve
    end

    it { is_expected.to(forbid_actions([:index, :new, :create, :edit, :update])) }
    it { is_expected.to(permit_actions([:show, :destroy])) }

    it "includes users from resolved scope" do
      expect(resolved_scope).to(include(user))
    end
  end

  context "being a coordinator" do
    let(:user) { User.create(auth0_id: "1") }
    let(:current_user) { Auth0::AuthenticationConcern::CurrentUser.new({ "uid" => "2", "roles" => ["Coordinator"] }) }
    let(:resolved_scope) do
      described_class::Scope.new(current_user, User.all).resolve
    end

    it { is_expected.to(forbid_actions([:index, :new, :create, :show, :edit, :update, :destroy])) }

    it "includes users from resolved scope" do
      expect(resolved_scope).to_not(include(user))
    end
  end

  context "being an administrator" do
    let(:user) { User.create(auth0_id: "1") }
    let(:current_user) { Auth0::AuthenticationConcern::CurrentUser.new({ "uid" => "3", "roles" => ["Administrator"] }) }
    let(:resolved_scope) do
      described_class::Scope.new(current_user, User.all).resolve
    end

    it { is_expected.to(permit_actions([:index, :show, :destroy])) }
    it { is_expected.to(forbid_actions([:new, :create, :edit, :update])) }

    it "includes users from resolved scope" do
      expect(resolved_scope).to(include(user))
    end
  end
end
