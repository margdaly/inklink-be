class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def error_message
    {
      errors: [
        {
          detail: @error.message
        }
      ]
    }
  end
end
