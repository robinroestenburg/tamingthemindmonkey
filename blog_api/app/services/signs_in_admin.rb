module Admins
  class Admins::SignsInAdmin

    def initialize(admin)
      @admin = admin
    end

    def perform
      sign_in(:admin, @admin)
      @admin.ensure_authentication_token!
    end
  end
end
