# frozen_string_literal: true

module SessionHelper
  def state
    state = SecureRandom.hex(24)
    session["omniauth.state"] = state

    state
  end

  def state_meta_tag
    state = SecureRandom.hex(24)
    session["omniauth.state"] = state

    tag("meta", name: "state", content: state)
  end
end
