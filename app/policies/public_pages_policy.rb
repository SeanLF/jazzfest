class PublicPagesPolicy < Struct.new(:user, :public_pages)
  # include ::Auth0::AuthenticationConcern

  def home?
    true
  end
end