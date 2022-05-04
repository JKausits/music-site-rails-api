class AuthenticationError < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = "application/json"
    self.response_body = { messages: [http_auth_body] }.to_json
  end
end
