module Pechkin
  class ApiException < StandardError
  end

  class NoDataException < ApiException
  end
end
