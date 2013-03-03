class CustomFailure < Devise::FailureApp
  def respond
    if request.format == :json
      json_failure
    else
      super
    end
  end

  def json_failure
    self.status = 401
    self.content_type = 'json'
    self.response_body = "{'error' : 401, 'details' => 'Could not be authenticated.'}"
  end
end