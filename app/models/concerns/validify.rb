module Validify
  module InstanceMethods
    def user_params_blank?(params)
      if params.has_value?("") || params.has_value?(nil)
      end
  end
end
