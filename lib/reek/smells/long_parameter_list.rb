require File.join( File.dirname( File.expand_path(__FILE__)), 'smell_detector')
require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))), 'smell_warning')
require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))), 'core', 'smell_configuration')

module Reek
  module Smells

    #
    # A Long Parameter List occurs when a method has more than one
    # or two parameters, or when a method yields more than one or
    # two objects to an associated block.
    #
    # Currently +LongParameterList+ reports any method or block with too
    # many parameters.
    #
    class LongParameterList < SmellDetector

      # The name of the config field that sets the maximum number of
      # parameters permitted in any method or block.
      MAX_ALLOWED_PARAMS_KEY = 'max_params'

      # The default value of the +MAX_ALLOWED_PARAMS_KEY+ configuration
      # value.
      DEFAULT_MAX_ALLOWED_PARAMS = 3

      def self.default_config
        super.adopt(
          MAX_ALLOWED_PARAMS_KEY => DEFAULT_MAX_ALLOWED_PARAMS,
          Core::SmellConfiguration::OVERRIDES_KEY => {
            "initialize" => {MAX_ALLOWED_PARAMS_KEY => 5}
            }
        )
      end

      def initialize(source, config = LongParameterList.default_config)
        super(source, config)
      end

      #
      # Checks the number of parameters in the given scope.
      # Remembers any smells found.
      #
      def examine_context(method_ctx)
        num_params = method_ctx.parameters.length
        return false if num_params <= value(MAX_ALLOWED_PARAMS_KEY, method_ctx, DEFAULT_MAX_ALLOWED_PARAMS)
        found(method_ctx, "has #{num_params} parameters",
          'LongParameterList', {'parameter_count' => num_params})
      end
    end
  end
end
