# frozen_string_literal: true

require 'rails_helper'

describe ResourcePolicy do
  subject { described_class.new(user, resource) }

  class Resource
    attr_accessor :id
    attr_accessor :exists

    def self.none(*_)
      @exists = false
      self
    end

    def self.all(*_)
      @exists = true
      self
    end

    def self.where(*_)
      self
    end

    def self.exists?(*_)
      @exists != false
    end
  end

  let(:resource) { Resource.new }

  context 'being a visitor' do
    let(:user) { Auth0::AuthenticationConcern::CurrentUser.new(nil) }
    let(:resolved_scope) do
      described_class::Scope.new(user, Resource.all).resolve
    end

    it { is_expected.to forbid_actions(%i[index new create show edit update destroy]) }
  end

  context 'being an administrator' do
    let(:user) { Auth0::AuthenticationConcern::CurrentUser.new({ 'uid' => 'github|1', 'roles' => ['Administrator'] }) }
    let(:resolved_scope) do
      described_class::Scope.new(user, Resource.all).resolve
    end

    it { is_expected.to permit_actions(%i[index new create show edit update destroy]) }
  end
end
