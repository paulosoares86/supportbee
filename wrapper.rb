class MissingTokenException < Exception
end


class SupportBee

  def initialize(auth_token: nil)
    raise MissingTokenException if auth_token.nil?
  end
end
